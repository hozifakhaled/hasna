import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:math' as math;

class QiblaCompass extends StatefulWidget {
  const QiblaCompass({Key? key}) : super(key: key);

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  double? _qiblaDirection;
  double _deviceDirection = 0;
  String _error = '';
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _startListeningToMagnetometer();
  }

  @override
  void dispose() {
    _magnetometerSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _error = 'خدمة تحديد الموقع غير مفعلة';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _error = 'تم رفض إذن تحديد الموقع';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _error = 'إذن تحديد الموقع مرفوض نهائياً';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double direction = _calculateQiblaDirection(position.latitude, position.longitude);
    setState(() {
      _qiblaDirection = direction;
    });
  }

  void _startListeningToMagnetometer() {
    _magnetometerSubscription = magnetometerEvents.listen((MagnetometerEvent event) {
      double angle = math.atan2(event.y, event.x) * (180 / math.pi);
      if (angle < 0) {
        angle += 360;
      }
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

  @override
  Widget build(BuildContext context) {
    double? angleToQibla;
    if (_qiblaDirection != null) {
      angleToQibla = (_qiblaDirection! - _deviceDirection) % 360;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('اتجاه القبلة بالبوصلة'),
        centerTitle: true,
      ),
      body: Center(
        child: _error.isNotEmpty
            ? Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            : (_qiblaDirection == null)
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green, width: 4),
                            ),
                          ),
                          Transform.rotate(
                            angle: (angleToQibla! * math.pi) / 180,
                            child: Icon(Icons.arrow_upward, size: 100, color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "زاوية القبلة: ${_qiblaDirection!.toStringAsFixed(2)}°",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "اتبع السهم للقبلة",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
      ),
    );
  }
}
