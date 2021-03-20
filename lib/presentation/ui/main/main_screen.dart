import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_app_bar.dart';
import 'controller/main_controller.dart';
import 'indexed_stack.dart';

class MainScreen extends StatelessWidget {
  static const ROUTE_NAME = "/main_screen";
  final MainController _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    double iWidth = (MediaQuery.of(context).size.width - 20.0) / 5.0;
    print("Size ${iWidth}");
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: MainScreenIndexedStack(),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
