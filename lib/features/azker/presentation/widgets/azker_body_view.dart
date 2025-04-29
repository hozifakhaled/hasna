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
          final zaker = state.akerEntitiy;

          counts ??= zaker.map((e) => e.count).toList();

          return Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: zaker.length,
                  itemBuilder: (context, index) {
                    return Zaker(
                      onTap: () => onTap(index),
                      zaker: zaker[index].description,
                      asnad: zaker[index].esnadname,

                      numberofzaker: '${zaker[index].count} مرات',
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                child: ZakerBottomBar(
                  totalAzker: zaker.length,
                  currentAzker: currentIndex + 1,
                  audioUrl: zaker[currentIndex].audioUrl,
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
