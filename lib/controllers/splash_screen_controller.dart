import 'dart:async';

import 'package:get/get.dart';
import 'package:try_get/pages/home.dart';

class SplashScreenController extends GetxController {
  void redirectToHome() {
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const Home());
    });
  }
}