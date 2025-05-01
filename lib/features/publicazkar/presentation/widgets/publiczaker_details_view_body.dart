import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/column_text_and_number_counter.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/custom_circle_prograss.dart';

class PubliczakerDetailsViewBody extends StatelessWidget {
  const PubliczakerDetailsViewBody({super.key, required this.model});
  final TasabihModel model;

  @override
  Widget build(BuildContext context) 
  
  
  {
   
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<PublicazkarCubit, PublicazkarState>(
        builder: (context, state) {
          if (state is PublicazkarSuccess) {
            context.read<PublicazkarCubit>().getAllTasabih();
            final TasabihModel updatedModel = state.tasabih.firstWhere(
              (e) => e.id == model.id,
              orElse: () => model,
            );

            return Column(
              children: [
                SizedBox(height: 20.h),
                Text(
                  updatedModel.taxt,
                  style: TextStyles.text21.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnTextAndnumberCounter(text: ' دورة ', number: '5'),
                    ColumnTextAndnumberCounter(
                      text: 'العدد الكلي ',
                      number: updatedModel.sumNumber.toString(),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                CustomCircleProgress(model: updatedModel),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                   context.read<PublicazkarCubit>().updateTasabih(updatedModel.copyWith(sumNumber: 0));
                    
                  },
                    child: ContainerInZekrWidget(
                      width: 50.0.h,
                      height: 50.0.h,
                      color: AppColors.secondcolor,
                      child: Icon(Icons.sync, color: AppColors.light),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
