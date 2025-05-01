import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/publiczekr_view_body.dart';

class PubliczekrView extends StatelessWidget {
  const PubliczekrView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<PublicazkarCubit>(),
      child: PubliczekrViewBody(),
    );
  }
}
