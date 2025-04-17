import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/custome_appbar2.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/features/morningazker/presentation/cubit/morningazker_cubit.dart';

class MorningAzkarViewBody extends StatefulWidget {
  const MorningAzkarViewBody({super.key});
  

  @override
  State<MorningAzkarViewBody> createState() => _MorningAzkarViewBodyState();
}

class _MorningAzkarViewBodyState extends State<MorningAzkarViewBody> {
  late PageController _pageController;

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

 @override
Widget build(BuildContext context) {
  return BlocConsumer<MorningazkerCubit, MorningazkerState>(
    listener: (context, state) {
      if (state is MorningazkerError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
    },
    builder: (context, state) {
      if (state is MorningazkerLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(), // عرض التحميل هنا بدلاً من شاشة سوداء
          ),
        );
      } else if (state is MorningazkerLoaded) {
        final azkarList = state.morningazkerEntitiy;
        
  return Scaffold(
  body: SafeArea(
    child: Column(
      children: [
        CustomeAppbar2(title: 'أذكار الصباح',),
        const SizedBox(height: 20),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: azkarList.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              // final nextPage = index + 1;
              // GoRouter.of(context).go('/morningazkar?page=$nextPage');
            },
            itemBuilder: (context, index) {
              final zeker = azkarList[index];
              return Zaker(
                zaker: zeker.description,
                asnad: zeker.esnadname,
                totalAzker: azkarList.length,
                currentAzker: index + 1,
                number: zeker.count,
                numberofzaker: zeker.count.toString(),
              );
            },
          ),
        ),
      ],
    ),
  ),
);

      } else {
        return const Scaffold(
          body: Center(child: Text('لا توجد بيانات')),
        );
      }
    },
  );
}

}
