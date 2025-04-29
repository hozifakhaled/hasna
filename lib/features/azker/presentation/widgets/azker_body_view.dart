import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/circal_number_zaker.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/core/widgets/zaker_bottom_bar.dart';
import 'package:hasna/features/azker/presentation/cubit/azker_cubit.dart';

class EveningazkerBodyView extends StatefulWidget {
  const EveningazkerBodyView({super.key});

  @override
  State<EveningazkerBodyView> createState() => _EveningazkerBodyViewState();
}

class _EveningazkerBodyViewState extends State<EveningazkerBodyView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  List<int>? counts;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  onTap(int index) {
    setState(() {
      if (counts![index] > 0) {
        counts![index] = counts![index] - 1;

        if (counts![index] == 0 && index + 1 < counts!.length) {
          _pageController.animateToPage(
            index + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  void _onPageChanged() {
    int newIndex = _pageController.page?.round() ?? 0;
    if (currentIndex != newIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkerCubit, AzkerState>(
      builder: (context, state) {
        if (state is AzkerLoaded) {
          counts ??= state.akerEntitiy.map((e) => e.count).toList();

          return Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: state.akerEntitiy.length,
                  itemBuilder: (context, index) {
                    return Zaker(
                      onTap: () => onTap(index),
                      zaker: state.akerEntitiy[index].description,
                      asnad: state.akerEntitiy[index].esnadname,

                      numberofzaker: '${state.akerEntitiy[index].count} مرات',
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: ZakerBottomBar(
                  totalAzker: state.akerEntitiy.length,
                  currentAzker: currentIndex + 1,
                  audioUrl: state.akerEntitiy[currentIndex].audioUrl,
                ),
              ),
              CircalNumberZaker(
                number: counts![currentIndex],
                onTap: () => onTap(currentIndex),
              ),
            ],
          );
        } else if (state is AzkerError) {
          return const Center(child: Text('تعذر تحميل الأذكار'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
