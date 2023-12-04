import 'package:flutter/material.dart';

import '../../views/home/home_screen.dart';

class SplashViewModel {
  void goTo(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }
}
