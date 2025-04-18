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

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playAudio() async {
    try {
      if (_audioPlayer.playing) {
        await _audioPlayer.stop();
      }
      await _audioPlayer.setUrl(widget.audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint("❌ Error playing audio: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("فشل في تشغيل الصوت")),
      );
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
                  onPressed: _playAudio,
                  icon: const Icon(
                    Icons.arrow_left,
                    color: AppColors.maincolor,
                    size: 55,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'x1',
                  style: TextStyles.text20.copyWith(color: AppColors.maincolor),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {}, // نجمة المفضلة، يمكنك ربطها بالـ Cubit لاحقًا
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
