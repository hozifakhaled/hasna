import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';
import 'package:hasna/core/widgets/custom_textformfiled.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';

class BottomSheetAddZaker extends StatelessWidget {
  const BottomSheetAddZaker({
    super.key, 
   // required this.onTap,
  });
  
 // final void Function(TasabihModel tasbih) onTap;
  
  @override
  State<BottomSheetAddZaker> createState() => _BottomSheetAddZakerState();
}

class _BottomSheetAddZakerState extends State<BottomSheetAddZaker> {

  
 
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormFiled(
              text: 'أدخل الذكر',
              controller: context.read<PublicazkarCubit>().zakerController,
            ),
            SizedBox(height: 20),
            CustomTextFormFiled(
              text: 'أدخل عدد السبحه',
              controller: context.read<PublicazkarCubit>().countController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'إضافة الذكر', 
              buttonbodycolor: AppColors.secondcolor, 
              textcolor: Colors.white, 
            onTap: () {
              print('تسبيح: ${context.read<PublicazkarCubit>().zakerController.text}');
  if ( context.read<PublicazkarCubit>().zakerController.text.isEmpty || context.read<PublicazkarCubit>().countController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('الرجاء إدخال النص والعدد')),
    );
    return;
  }

  final newTasbih = TasabihModel(
    taxt: context.read<PublicazkarCubit>().zakerController.text,
    number: 0,
    sumNumber: int.tryParse(context.read<PublicazkarCubit>().countController.text) ?? 33,
    id: DateTime.now().millisecondsSinceEpoch,
  );

  // استدعاء Cubit
  final cubit = context.read<PublicazkarCubit>();
  cubit.addTasabih(newTasbih);

  Navigator.pop(context); // اغلاق الـ BottomSheet
},

            ),
          ],
        ),
      ),
    );
  }
}