import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/constants/images.dart';
import 'package:hasna/core/routing/routes.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_button.dart';
import 'package:hasna/core/widgets/custom_textformfiled.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/zekr_options_menu.dart';

class ZekrWiget extends StatelessWidget {
  const ZekrWiget({super.key, required this.tasabih});
final TasabihModel tasabih ;
  @override
  Widget build(BuildContext context) {
    final cubitContext = context;
    
    return InkWell(
      onTap: () async{
     final result = await GoRouter.of(context).push<bool>(
   Routes.dpublicazkar,
    extra: tasabih,
  );

  if (result == true) {
    // حصل تعديل في التفاصيل
    // ignore: use_build_context_synchronously
    context.read<PublicazkarCubit>().getAllTasabih();
  }
},
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.thirdcolor,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(Assets.imagesCornertopleft),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tasabih.taxt,
                          style: TextStyles.text20.copyWith(
                            color: AppColors.maincolor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'عدد التسبيح ${tasabih.sumNumber}',
                          style: TextStyles.text18.copyWith(
                            color: AppColors.maincolor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  ZekrOptionsMenu(
                    onEdit: (){
                      _showeditConfirmationDialog(context, tasabih);
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title:  Text('تأكيد الحذف',
                            style: TextStyles.text20.copyWith(color: Colors.black),
                           
                          ),
                          content: const Text('هل أنت متأكد أنك تريد حذف هذا التسبيح؟'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child:  Text('إلغاء',
                                style: TextStyles.text15.copyWith(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                cubitContext.read<PublicazkarCubit>().deleteTasabih(tasabih.id);
                                Navigator.pop(dialogContext);
                              },
                              child: const Text('حذف', style: TextStyle(color: AppColors.maincolor, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   void _showeditConfirmationDialog(BuildContext context,TasabihModel tasbih) {
    showDialog(
      context: context,

      builder:
          (dialogContext) => AlertDialog(
            backgroundColor: AppColors.maincolor,
            title: const Text('تعديل'),
            content: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    CustomTextFormFiled(
                      text: tasbih.taxt ,
                      controller:
                          context.read<PublicazkarCubit>().zakerController,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormFiled(
                      text: tasbih.number.toString(),
                      controller:
                          context.read<PublicazkarCubit>().countController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'إضافة الذكر',
                      buttonbodycolor: AppColors.secondcolor,
                      textcolor: Colors.white,
                      onTap: () {
                        final text =
                            context
                                .read<PublicazkarCubit>()
                                .zakerController
                                .text
                                .trim();
                        final number =
                            int.tryParse(
                              context
                                  .read<PublicazkarCubit>()
                                  .countController
                                  .text,
                            ) ??
                            33;

                        if (text.isNotEmpty) {
                          final newTasbih = TasabihModel(
                            taxt: text,
                            number: number,
                            sumNumber: tasbih.sumNumber,
                            id:tasbih. id,
                          );

                          context.read<PublicazkarCubit>().updateTasabih(
                            newTasbih,
                          );
                          context.read<PublicazkarCubit>().countController.clear();
                          context.read<PublicazkarCubit>().zakerController.clear();
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
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('إلغاء'),
              ),
            ],
          ),
    );
  }

}
