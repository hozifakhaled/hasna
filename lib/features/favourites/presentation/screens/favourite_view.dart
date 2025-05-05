import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:hasna/features/favourites/presentation/widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FavouritesCubit>()..loadFavourites(),
      child: FavouriteViewBody(),
    );
  }
}
