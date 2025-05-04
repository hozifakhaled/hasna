import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/bottom_sheet_add_zaker.dart';

class RowSumAndAddTasbiha extends StatelessWidget {
  const RowSumAndAddTasbiha({
    super.key,
    required int totalSum,
  }) : _totalSum = totalSum;

  final int _totalSum;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          InkWell(
            onTap:
                () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder:
                      (_) => BlocProvider.value(
                        value:  sl<PublicazkarCubit>(),
                        child: BottomSheetAddZaker(),
                      ),
                  backgroundColor: AppColors.maincolor,
                ),
            child: ContainerInZekrWidget(
              width: 50.0.w,
              height: 50.0.h,
              color: AppColors.secondcolor,
              child: Icon(Icons.add, color: AppColors.light),
            ),
          ),
          ContainerInZekrWidget(
            width: 120.0.w,
            height: 50.0.h,
            color: AppColors.secondcolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'المجموع',
                  style: TextStyles.textwiget100.copyWith(
                    color: AppColors.light,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '$_totalSum',
                  style: TextStyles.textwiget100.copyWith(
                    color: AppColors.light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}