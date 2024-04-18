import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_get/controllers/home_controller.dart';

class Home extends StatelessWidget {
  const Home({ super.key });

  @override
  Widget build(BuildContext context) {
    final HomeController ctrl = HomeController();

    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text('Clicks ${ctrl.count}')),
          ),
          body: Builder(
            builder: (context) {
            if (ctrl.load.isTrue) {
              return CircularProgressIndicator();
            }

            return Center(
                child: IconButton(
                  onPressed: () {
                    ctrl.increment();
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.indigo)
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
