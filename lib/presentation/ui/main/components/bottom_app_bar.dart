import 'package:find_inspiration/presentation/themes/app_colors.dart';
import 'package:find_inspiration/presentation/ui/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'bottom_app_bar_item.dart';

class MyBottomAppBar extends StatelessWidget {
  MyBottomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        color: Colors.white,
        child: GetX<MainController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomAppItem(BottomItem.STORY, controller.selectedItem.value.bottomItem),
              BottomAppItem(BottomItem.CREATE_STORY, controller.selectedItem.value.bottomItem),
              BottomAppItem(BottomItem.PROFILE, controller.selectedItem.value.bottomItem),
            ],
          ),
        ),
        ),
    );
  }
}

