import 'package:flutter/material.dart';
import 'package:it_school_mvvm/view_models/splash/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final viewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.goTo(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
