import 'package:find_inspiration/presentation/ui/create_story/controller/create_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_field.dart';

class AddInfoWidget extends StatelessWidget {
  AddInfoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: GetX<CreateStoryController>(
        builder: (controller) =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldWidget(
              editingController:
              controller.textEditingControllerPrice,
              label: "Price",
              errorMsg: controller.priceError.value,
            ),
            SizedBox(
              width: 20,
            ),
            TextFieldWidget(
              editingController:
              controller.textEditingControllerTitle,
              label: "Title",
              errorMsg: controller.titleError.value,
            ),
          ],
        ),
      ),
    );
  }
}
