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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is MorningazkerLoaded) {
            return PageView.builder(
          itemCount: state.morningazkerEntitiy.length,
          itemBuilder: (context, index) {
            return Zaker(
              zaker: state.morningazkerEntitiy[index].description,
              asnad: state.morningazkerEntitiy[index].esnadname,
              totalAzker: state.morningazkerEntitiy[index].totalAzkar,
              currentAzker: state.morningazkerEntitiy[index].count,
              number: state.morningazkerEntitiy[index].count,
              numberofzaker: state.morningazkerEntitiy[index].count.toString(),
            );
          },
        );
        } else if (state is MorningazkerLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Error loading azkar'));
        }
      
      },
    );
  }
}
