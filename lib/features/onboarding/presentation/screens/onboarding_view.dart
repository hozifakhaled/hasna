import 'package:flutter/material.dart';
import 'package:hasna/features/onboarding/presentation/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OnboardingViewBody(),
    );
  }
}