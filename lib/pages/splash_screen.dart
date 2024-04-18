import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:try_get/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    final SplashScreenController ctrl = SplashScreenController();

    ctrl.redirectToHome();

    return Container( 
      color: Colors.grey, 
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie.asset(
                //   'assets/animations/load.json',
                //   height: 120,
                //   fit: BoxFit.fill
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

