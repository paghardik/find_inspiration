import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';

class MainScreenIndexedStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: IndexedStack(
          index: controller.selectedItem.value.bottomItem.index,
          children: [
            StoryScreen(),
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.brown,
            )
          ],
        ),
      ),
    );
  }
}
