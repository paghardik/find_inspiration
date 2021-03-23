import 'package:find_inspiration/presentation/themes/app_colors.dart';
import 'package:find_inspiration/presentation/ui/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomAppItem extends StatelessWidget {
  final MainController _mainController = Get.find<MainController>();

  final List<String> iconList = [
    "assets/svgs/circle.svg",
    "assets/svgs/add.svg",
    "assets/svgs/user.svg"
  ];

  final BottomItem item;
  final BottomItem selectedItem;

  BottomAppItem(this.item, this.selectedItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          _mainController.selectTab(item);
        },
        iconSize: item == BottomItem.CREATE_STORY ? 45 : 22,
        icon: SvgPicture.asset(
          iconList[item.index],
          color: AppColors.selectedColor(selectedItem == item),
        ),
      ),
    );
  }

}

enum BottomItem{
  STORY,
  CREATE_STORY,
  PROFILE
}
extension BottomItemExtension on BottomItem {

  int? get index {
    switch (this) {
      case BottomItem.STORY:
        return 0;
      case BottomItem.CREATE_STORY:
        return 1;
      case BottomItem.PROFILE:
        return 2;
      default:
        return null;
    }
  }

  String? get name {
    switch(this){
      case BottomItem.STORY:
        return "BottomItem.STORY";
      case BottomItem.CREATE_STORY:
        return "BottomItem.CREATE_STORE";
      case BottomItem.PROFILE:
        return "BottomItem.PROFILE";
      default:
        return null;
    }
  }

  void currentSelectedTab() {
    print("Index: $index Tab Name: $name");
  }
}



