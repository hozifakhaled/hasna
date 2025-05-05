import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vibration/vibration.dart';

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({super.key});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  double? _qiblaDirection;
  double _deviceDirection = 0;
  String _error = '';
  bool _isAligned = false;
  bool _isLoadingLocation = true;
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;
  StreamSubscription<ServiceStatus>? _locationServiceStatusSubscription;

  @override
  void initState() {
    super.initState();
    _startLocationServiceStatusListener();
    _startListeningToMagnetometer();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _magnetometerSubscription?.cancel();
    _locationServiceStatusSubscription?.cancel();
    super.dispose();
  }

  // إضافة مراقب لحالة خدمة الموقع
  void _startLocationServiceStatusListener() async {
    _locationServiceStatusSubscription = Geolocator.getServiceStatusStream().listen(
      (ServiceStatus status) {
        if (status == ServiceStatus.enabled) {
          // إذا تم تفعيل خدمة الموقع، قم بإعادة محاولة الحصول على الموقع
          setState(() {
            _error = '';
            _isLoadingLocation = true;
          });
          _getCurrentLocation();
        } else {
          setState(() {
            _error = 'من فضلك قم بتفعيل خدمة الموقع';
            _isLoadingLocation = false;
          });
        }
      },
    );
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
      _error = '';
    });

    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _error = 'من فضلك قم بتفعيل خدمة الموقع';
        _isLoadingLocation = false;
      });
      return;
    }

    // تحقق من إذن الوصول إلى الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _error = 'تم رفض إذن تحديد الموقع';
          _isLoadingLocation = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _error = 'إذن تحديد الموقع مرفوض نهائياً';
        _isLoadingLocation = false;
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double direction = _calculateQiblaDirection(position.latitude, position.longitude);
      setState(() {
        _qiblaDirection = direction;
        _isLoadingLocation = false;
      });
    } catch (e) {
      setState(() {
        _error = 'حدث خطأ أثناء تحديد الموقع: ${e.toString()}';
        _isLoadingLocation = false;
      });
    }
  }

  void _startListeningToMagnetometer() {
    // ignore: deprecated_member_use
    _magnetometerSubscription = magnetometerEvents.listen((MagnetometerEvent event) {
      double angle = math.atan2(event.x, event.y) * (180 / math.pi);
      if (angle < 0) {
        angle += 360;
      }
      angle = (360 - angle) % 360;
      setState(() {
        _deviceDirection = angle;
      });
    });
  }

  double _calculateQiblaDirection(double userLat, double userLng) {
    const double kaabaLat = 21.4225;
    const double kaabaLng = 39.8262;

    double deltaLng = (kaabaLng - userLng) * (math.pi / 180);
    double userLatRad = userLat * (math.pi / 180);
    double kaabaLatRad = kaabaLat * (math.pi / 180);

    double y = math.sin(deltaLng) * math.cos(kaabaLatRad);
    double x = math.cos(userLatRad) * math.sin(kaabaLatRad) -
        math.sin(userLatRad) * math.cos(kaabaLatRad) * math.cos(deltaLng);

    double bearing = math.atan2(y, x);
    bearing = bearing * (180 / math.pi);
    bearing = (bearing + 360) % 360;

    return bearing;
  }

  Future<void> _vibrateIfAligned(double angleToQibla) async {
    if (angleToQibla >= 0 && angleToQibla <= 5 || angleToQibla >= 355 && angleToQibla <= 360) {
      if (!_isAligned) {
        if (await Vibration.hasVibrator() ) {
          Vibration.vibrate(duration: 500);
        }
        setState(() {
          _isAligned = true;
        });
      }
    } else {
      if (_isAligned) {
        setState(() {
          _isAligned = false;
        });
      }
    }
  }

  // زر إعادة تحميل يدوي
  Widget _buildRetryButton() {
    return ElevatedButton.icon(
      onPressed: _getCurrentLocation,
      icon: const Icon(Icons.refresh, color: Colors.white),
      label: const Text(
        "إعادة المحاولة",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B9E8D),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double? angleToQibla;
    if (_qiblaDirection != null) {
      angleToQibla = (_qiblaDirection! - _deviceDirection);
      if (angleToQibla < 0) {
        angleToQibla += 360;
      }
      _vibrateIfAligned(angleToQibla);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('اتجاه القبلة', style: TextStyles.text15),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // زر إعادة تحميل في شريط التطبيق
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _getCurrentLocation,
            tooltip: 'إعادة تحميل',
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF5A6E5C), // لون أخضر مثل الصورة المرفقة
        ),
        child: _error.isNotEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _error,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildRetryButton(),
                  ],
                ),
              )
            : (_isLoadingLocation)
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 20),
                        Text(
                          "جاري تحديد اتجاه القبلة...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(height: AppBar().preferredSize.height + 20),
                      // بطاقة اتجاه القبلة
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B9E8D),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "اتجاه القبلة: ${_qiblaDirection!.toStringAsFixed(1)}°",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.explore,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // بوصلة اتجاه القبلة
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // البوصلة الدوارة
                              Transform.rotate(
                                angle: (angleToQibla! * math.pi) / 180,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    // صورة البوصلة
                                    Image.asset(
                                      'assets/images/compass.png',
                                      width: 300,
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              
                              // النقطة الحمراء (مؤشر القبلة)
                              Positioned(
                                top: 45,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              
                              // الدائرة الخارجية عندما تكون متحاذية
                              if (_isAligned)
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.2),
                                    boxShadow: [
                                      BoxShadow(
                                        // ignore: deprecated_member_use
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 20,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                
                              // صورة الكعبة في المنتصف تماماً
                             
                            ],
                          ),
                        ),
                      ),
                      // رسالة توجيهية
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B9E8D),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          _isAligned 
                              ? "أنت الآن في اتجاه القبلة الصحيح" 
                              : "قم بتوجيه هاتفك نحو اتجاه القبلة",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // صورة توضيحية
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Image.asset(
                            Assets.imagesOnbooardingimage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
