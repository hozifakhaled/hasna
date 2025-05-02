import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/list_zaker_widget.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/publiczaker_appbar.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/row_sum_and_add_tasbiha.dart';

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
            PubliczakerAppbar(),
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
                        return ListZakerWidget(tasabih: state.tasabih,);
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

                  RowSumAndAddTasbiha(totalSum: _totalSum),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // حوار تأكيد إعادة تعيين المجموع الكلي
  }





