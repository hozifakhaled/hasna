import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/extention/extention.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:just_audio/just_audio.dart';

class ZakerBottomBar extends StatefulWidget {
  const ZakerBottomBar({
    super.key,
    required this.totalAzker,
    required this.currentAzker,
    required this.audioUrl,
  });

  final int totalAzker;
  final int currentAzker;
  final String audioUrl;

  @override
  State<ZakerBottomBar> createState() => _ZakerBottomBarState();
}

class _ZakerBottomBarState extends State<ZakerBottomBar> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // عند انتهاء الصوت نرجع زر التشغيل
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (mounted) {
          setState(() {
            _isPlaying = false;
          });
        }
      }
    });
  }

  void _changeSpeed() {
    setState(() {
      if (_playbackSpeed == 1.0) {
        _playbackSpeed = 1.25;
      } else if (_playbackSpeed == 1.25) {
        _playbackSpeed = 1.5;
      } else if (_playbackSpeed == 1.5) {
        _playbackSpeed = 2.0;
      } else {
        _playbackSpeed = 1.0; // يرجع للوضع الطبيعي
      }
      _audioPlayer.setSpeed(_playbackSpeed); // تطبيق السرعة
    });
  }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        if (mounted) {
          setState(() {
            _isPlaying = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _isPlaying = true; // تظهر الأيقونة مباشرة
          });
        }
        await _audioPlayer.setUrl(widget.audioUrl);
        await _audioPlayer.play();
      }
    } catch (e) {
      debugPrint("❌ Error playing audio: $e");
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("فشل في تشغيل الصوت")));
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.1,
      decoration: const BoxDecoration(
        color: AppColors.thirdcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: _togglePlayPause,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppColors.maincolor,
                    size: 35,
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: _changeSpeed,
                  child: Text(
                    'x${_playbackSpeed.toStringAsFixed(2) == '1.00'
                        ? '1'
                        : _playbackSpeed.toStringAsFixed(2) == '2.00'
                        ? '2'
                        : _playbackSpeed.toStringAsFixed(2)}',
                    style: TextStyles.text20.copyWith(
                      color: AppColors.maincolor,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {}, // زر المفضلة لاحقًا
                  icon: const Icon(
                    Icons.star_border,
                    color: AppColors.maincolor,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '${widget.totalAzker}/${widget.currentAzker}',
                  style: TextStyles.text20.copyWith(color: AppColors.maincolor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
