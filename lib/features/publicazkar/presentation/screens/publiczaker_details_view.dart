import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/presentation/cubit/publicazkar_cubit.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/publiczaker_details_view_body.dart';

class PubliczakerDeatilsView extends StatelessWidget {
  const PubliczakerDeatilsView({super.key, required this.model});
  final TasabihModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<PublicazkarCubit>()..getTasabihById(model.id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.maincolor,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop(true);
                },
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),

        body: PubliczakerDetailsViewBody(model: model),
      ),
    );
  }
}
