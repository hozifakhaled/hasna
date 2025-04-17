import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/widgets/zaker.dart';
import 'package:hasna/features/eveningazker/presentation/cubit/eveningazker_cubit.dart';

class EveningazkerBodyView extends StatefulWidget {
  const EveningazkerBodyView({super.key});

  @override
  State<EveningazkerBodyView> createState() => _EveningazkerBodyViewState();
}

class _EveningazkerBodyViewState extends State<EveningazkerBodyView> {
  final PageController _pageController = PageController();
  //int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EveningazkerCubit, EveningazkerState>(
      builder: (context, state) {
        if (state is EveningazkerLoaded) {
          return PageView.builder(
            controller: _pageController,
       
            
            itemCount: state.eveningakerEntitiy.length,
            itemBuilder: (context, index) {
              return Zaker(
                onTap: () {
                  _pageController.animateToPage(
                    index + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                zaker: state.eveningakerEntitiy[index].description,
                asnad: state.eveningakerEntitiy[index].esnadname,
                totalAzker: state.eveningakerEntitiy.length,
                currentAzker: index + 1,
                number: state.eveningakerEntitiy[index].count,
                numberofzaker: '${state.eveningakerEntitiy[index].count} مرات  ',
              );
            },
          );
        } else if (state is EveningazkerError) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
