import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';
import 'package:hasna/core/widgets/custom_textformfiled.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';

class BottomSheetAddZaker extends StatefulWidget {
  const BottomSheetAddZaker({
    super.key,
  });

  @override
  State<BottomSheetAddZaker> createState() => _BottomSheetAddZakerState();
}

class _BottomSheetAddZakerState extends State<BottomSheetAddZaker> {
  // إنشاء متحكمات محلية بدلاً من استخدام متحكمات الكيوبت
  final TextEditingController _zakerController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  @override
  void dispose() {
    _zakerController.dispose();
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      color: AppColors.maincolor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextFormFiled(
            text: 'أدخل الذكر',
            controller: _zakerController,
          ),
          SizedBox(height: 20),
          CustomTextFormFiled(
            text: 'أدخل عدد السبحه',
            controller: _countController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: 'إضافة الذكر',
            buttonbodycolor: AppColors.secondcolor,
            textcolor: Colors.white,
            onTap: () {
              print('تم الضغط على زر الإضافة');
              
              // التحقق من صحة المدخلات
              if (_zakerController.text.isEmpty || _countController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('الرجاء إدخال النص والعدد')),
                );
                return;
              }
              int sumNumber;
              try {
                sumNumber = int.parse(_countController.text);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('الرجاء إدخال رقم صحيح')),
                );
                return;
              }

              final newTasbih = TasabihModel(
                taxt: _zakerController.text,
                number: 0,
                sumNumber: sumNumber,
                id: DateTime.now().millisecondsSinceEpoch % 0xFFFFFF, 
              );

              // استدعاء Cubit لإضافة التسبيح
              final cubit = context.read<PublicazkarCubit>();
              cubit.addTasabih(newTasbih);
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}