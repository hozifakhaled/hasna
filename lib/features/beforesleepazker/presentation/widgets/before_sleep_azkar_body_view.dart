import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/features/eveningazker/presentation/cubit/eveningazker_cubit.dart';

class BeforeSleepAzkarBodyView extends StatefulWidget {
  const BeforeSleepAzkarBodyView({super.key});

  @override
  State<BeforeSleepAzkarBodyView> createState() => _BeforeSleepAzkarBodyViewState();
}

class _BeforeSleepAzkarBodyViewState extends State<BeforeSleepAzkarBodyView> {
  final PageController _pageController = PageController();
  List<int>? counts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeforesleepazkarCubit, BeforesleepazkarState>(
      builder: (context, state) {
        if (state is BeforesleepazkarLoaded) {
          // لو counts لسه متعملتش، ننسخ القيم الأصلية من الكيوبت
          counts ??= state.eveningakerEntitiy.map((e) => e.count).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: state.eveningakerEntitiy.length,
            itemBuilder: (context, index) {
              return Zaker(
                onTap: () {
                  setState(() {
                    if (counts![index] > 0) {
                      counts![index] = counts![index] - 1;

                      if (counts![index] == 0 && index + 1 < counts!.length) {
                        _pageController.animateToPage(
                          index + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    }
                  });
                },
                zaker: state.eveningakerEntitiy[index].description,
                asnad: state.eveningakerEntitiy[index].esnadname,
                totalAzker: state.eveningakerEntitiy.length,
                currentAzker: index + 1,
                number: counts![index],
                numberofzaker:
                    '${state.eveningakerEntitiy[index].count} مرات  ',
                audioUrl: state.eveningakerEntitiy[index].audioUrl,
              );
            },
          );
        } else if (state is BeforesleepazkarError) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
