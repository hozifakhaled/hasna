import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';
import 'package:hasna/core/widgets/custom_textformfiled.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';

class BottomSheetAddZaker extends StatelessWidget {
  const BottomSheetAddZaker({
    super.key, 
   
  });
  
 
 @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child:SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    final text = context.read<PublicazkarCubit>().zakerController.text.trim();
                    final number =
                        int.tryParse(context.read<PublicazkarCubit>().countController.text) ?? 33;

                    if (text.isNotEmpty) {
                      final newTasbih = TasabihModel(
                        taxt: text,
                        number: number,
                        sumNumber: 0,
                        id: DateTime.now().millisecondsSinceEpoch,
                      );

                      context.read<PublicazkarCubit>().addTasabih(newTasbih);
                      Navigator.pop(context); // غلق BottomSheet
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('الرجاء إدخال الذكر')),
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
    
  }
}