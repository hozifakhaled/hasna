import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/features/morningazker/presentation/cubit/morningazker_cubit.dart';

class MorningAzkarViewBody extends StatelessWidget {
  const MorningAzkarViewBody({super.key});

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
          itemCount: state.morningazkerEntitiy.totalAzkar,
          itemBuilder: (context, index) {
            return Zaker(
              onTap: () {
                  
                },
              zaker: state.morningazkerEntitiy.description,
              asnad: state.morningazkerEntitiy.esnadname,
              totalAzker: state.morningazkerEntitiy.totalAzkar,
              currentAzker: state.morningazkerEntitiy.totalAzkar,
              number: state.morningazkerEntitiy.count,
              numberofzaker: state.morningazkerEntitiy.count.toString(),
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
