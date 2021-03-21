import 'package:find_inspiration/presentation/ui/create_story/controller/create_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostStoryWidget extends StatelessWidget {
  CreateStoryController _createStoryController = Get.find<CreateStoryController>();
  PostStoryWidget({
    Key key,
  }) : super(key: key);

  _buttonClick(){
    _createStoryController.uploadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        height: 45.0,
        child: GetX<CreateStoryController>(
          builder: (controller) => ElevatedButton(
            onPressed: (controller.isTitleValid.value &&
                    controller.isPriceValid.value &&
                    controller.isImageValid.value)
                ? _buttonClick
                : null,
            child: Text('Post in Story'),
          ),
        ),
      ),
    );
  }
}
