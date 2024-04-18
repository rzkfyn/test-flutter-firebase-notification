import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  RxBool load = true.obs;
  RxList<int> a = [1].obs;

  void increment() => count++;

  void fetchHomeAnimeData() async {

    load = false.obs;
  }
}
