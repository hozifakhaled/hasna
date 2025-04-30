import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/features/publicazkar/presentation/widgets/publiczaker_details_view_body.dart';

class PubliczakerDeatilsView extends StatelessWidget {
  const PubliczakerDeatilsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.maincolor,automaticallyImplyLeading: false,actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(Icons.arrow_forward,color: Colors.white, size: 30,)),
        )
      ],),

      body:PubliczakerDetailsViewBody(),
    );
  }
}
