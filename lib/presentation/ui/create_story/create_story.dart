import 'dart:io';

import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:find_inspiration/presentation/themes/app_colors.dart';
import 'package:find_inspiration/presentation/ui/create_story/controller/create_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/add_info.dart';
import 'components/post_story_btn.dart';

class CreateStory extends StatelessWidget {
  CreateStoryController _createStoryController =
      Get.put(CreateStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 80),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Color(0xffb7db6d),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Text(
                      TranslationConstants.CREATE_STORY,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: GetX<CreateStoryController>(
                      builder: (controller) => controller.imageFile.value.path.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                controller.imageFile.value,
                                width: MediaQuery.of(context).size.width - 100,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width - 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              height: 100,
                              child: Icon(
                                Icons.camera_alt,
                                size: 50,
                              ),
                            ),
                    ),
                  ),
                ),
              )),
              Column(
                children: [
                  AddInfoWidget(),
                  PostStoryWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showPicker(context) {
  CreateStoryController _createStoryController =
      Get.find<CreateStoryController>();
  showModalBottomSheet(
      context: Get.context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      //_imgFromGallery();
                      _createStoryController.getImageFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _createStoryController.getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
