import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/container_in_zekrwidget.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/bottom_sheet_add_zaker.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/zekr_wiget.dart';

class PubliczekrViewBody extends StatefulWidget {
  const PubliczekrViewBody({super.key});

  @override
  State<PubliczekrViewBody> createState() => _PubliczekrViewBodyState();
}

class _PubliczekrViewBodyState extends State<PubliczekrViewBody> {
  int _totalSum = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final cubit = context.read<PublicazkarCubit>();
    await cubit.getAllTasabih();
    _updateTotalSum();
  }

  Future<void> _updateTotalSum() async {
    final totalSum = await context.read<PublicazkarCubit>().getTotalSum();
    setState(() {
      _totalSum = totalSum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.thirdcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showResetConfirmationDialog();
                      },
                      child: ContainerInZekrWidget(
                        width: 50.0.w,
                        height: 50.0.h,
                        color: AppColors.secondcolor,
                        child: Icon(Icons.sync, color: AppColors.light),
                      ),
                    ),
                    Text(
                      'لَا يَزَالُ لِسَانُكَ رَطْبًا بِذِكْرِ اللَّهِ',
                      style: TextStyles.textwiget100.copyWith(
                        color: AppColors.maincolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColors.maincolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  // قائمة التسابيح
                  BlocConsumer<PublicazkarCubit, PublicazkarState>(
                    listener: (context, state) {
                      if (state is PublicazkarSuccess) {
                        _updateTotalSum();
                      }
                    },
                    builder: (context, state) {
                      if (state is PublicazkarLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } 
                      if (state is PublicazkarSuccess) {
                        if (state.tasabih.isEmpty) {
                          return Center(
                            child: Text(
                              'لا توجد تسابيح', 
                              style: TextStyles.text20.copyWith(
                                color: AppColors.thirdcolor,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.tasabih.length,
                          itemBuilder: (context, index) {
                            final tasbih = state.tasabih[index];
                            return ZekrWiget(title: tasbih.taxt);
                          },
                        );
                      } else if (state is PublicazkarFailure) {
                        return Center(child: Text('خطأ: ${state.error}'));
                      }
                      return Center(
                        child: Text(
                          'لا توجد تسابيح', 
                          style: TextStyles.text20.copyWith(
                            color: AppColors.thirdcolor,
                          ),
                        ),
                      );
                    },
                  ),
                  
                  // زر الإضافة ومجموع التسابيح في الأسفل
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 50), // فراغ متوازن على اليسار
                        InkWell(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (_) =>  BottomSheetAddZaker(
                              onTap: () {
                               
                              },
                            ),
                            backgroundColor: AppColors.maincolor
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // حوار تأكيد إعادة تعيين المجموع الكلي
  void _showResetConfirmationDialog() {
    final PublicazkarCubit cubit = context.read<PublicazkarCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('إعادة تعيين'),
        content: const Text('هل تريد إعادة تعيين جميع العدادات؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              // إعادة تعيين جميع العدادات
              if (cubit.state is PublicazkarSuccess) {
                final tasabih = (cubit.state as PublicazkarSuccess).tasabih;
                for (var tasbih in tasabih) {
                  tasbih.number = 0;
                  cubit.updateTasabih(tasbih);
                }
              }
              
              Navigator.pop(dialogContext);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}