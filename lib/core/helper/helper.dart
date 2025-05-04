import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';

class Helper {
  void showResetConfirmationDialog(BuildContext context) {
    final PublicazkarCubit cubit = context.read<PublicazkarCubit>();

    showDialog(
      
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            backgroundColor: AppColors.maincolor,
            title: const Text('إعادة تعيين', style: TextStyle(color: Colors.white)),
            content: const Text('هل تريد إعادة تعيين جميع العدادات؟', style: TextStyle(color: Colors.white)),
            actions: [
              SizedBox(
                width: 40,
                height: 40,
                child: TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('إلغاء', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  // إعادة تعيين جميع العدادات
                  if (cubit.state is PublicazkarSuccess) {
                    final tasabih = (cubit.state as PublicazkarSuccess).tasabih;
                    for (var tasbih in tasabih) {
                      tasbih.sumNumber = 0;
                      cubit.updateTasabih(tasbih);
                    }
                  }

                  Navigator.pop(dialogContext);
                },
                child: Text('تأكيد',style: const TextStyle(color: Colors.white),),
              ),
            ],
          ),
    );
  }

}