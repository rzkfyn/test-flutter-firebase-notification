import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_get/controllers/home_controller.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String fcmToken = '';

  @override
  void initState() {
    super.initState();
    _loadFcmToken();
  }

  void _loadFcmToken() async {
    final loadedFcmToken = await FirebaseMessaging.instance.getToken() ?? '';

    print(loadedFcmToken);

    setState(() {
      fcmToken = loadedFcmToken;
    });
  }

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

            return Center(
                child: SelectableText(fcmToken),
              );
            }
          ),
        ),
      ),
    );
  }
}
