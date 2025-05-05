import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/core/texts_styleing/text_styles.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/azker/data/models/azkar_model.dart';
import 'package:hasna/features/azker/presentation/cubit/azker_cubit.dart';
import 'package:hasna/features/azker/presentation/widgets/azker_body_view.dart';

class AzkerView extends StatelessWidget {
 const AzkerView({super.key, required this.data});
final Map<String, String> data;
  @override
  Widget build(BuildContext context) {
    final azkerModel = AzkerModel(
      id: int.tryParse(data['id'] ?? '') ?? 0,
      description: data['description'] ?? '',
      audioUrl: data['audioUrl'] ?? '',
      esnadname: data['esnadname'] ?? '',
      count: int.tryParse(data['count'] ?? '') ?? 0,

      // Add other required fields from your AzkerModel
    );
    return BlocProvider.value(
      value:  sl.get<AzkerCubit>()..getAzker(data.values.first),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          ),
          backgroundColor: AppColors.maincolor,
          centerTitle: true,
          title: Text(
           data.values.elementAt(1),
            style: TextStyles.text20.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: EveningazkerBodyView(azkerModel: azkerModel),
      ),
    );
  }
}
