import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/features/morningazker/presentation/cubit/morningazker_cubit.dart';

class MorningAzkarViewBody extends StatefulWidget {
  const MorningAzkarViewBody({super.key});

  @override
  State<MorningAzkarViewBody> createState() => _MorningAzkarViewBodyState();
}

class _MorningAzkarViewBodyState extends State<MorningAzkarViewBody> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage(int itemCount) {
    if (currentPage < itemCount - 1) {
      currentPage += 1;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MorningazkerCubit, MorningazkerState>(
      listener: (context, state) {
        if (state is MorningazkerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is MorningazkerLoaded) {
          if (state.morningazkerEntitiy[currentPage].count == 0) {
            Future.delayed(const Duration(milliseconds: 300), () {
              _nextPage(state.morningazkerEntitiy.length);
            });
          }
        }
      },
      builder: (context, state) {
        if (state is MorningazkerLoaded) {
          return PageView.builder(
            controller: _pageController,
            itemCount: state.morningazkerEntitiy.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = state.morningazkerEntitiy[index];

              return Zaker(
                onTap: () {
                  BlocProvider.of<MorningazkerCubit>(context).EcdCount(index);
                },
                audioUrl: item.audioUrl ?? 'https://res.cloudinary.com/dtb8omfnm/video/upload/v1743514371/WhatsApp_Audio_2025-04-01_at_3.02.41_PM_uvyfbv.m4a',
                zaker: item.description,
                asnad: item.esnadname,
                totalAzker: item.totalAzkar,
                currentAzker: item.count,
                number: item.count,
                numberofzaker: item.count.toString(),
              );
            },
          );
        } else if (state is MorningazkerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('تعذر تحميل الأذكار'));
        }
      },
    );
  }
}
