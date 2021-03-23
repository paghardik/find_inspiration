import 'dart:ui';

import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/presentation/ui/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/story_tile_widget.dart';

class StoryScreen extends StatelessWidget {
  final StoryController _storyController = Get.find<StoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 100,
            color: Color(0xffb7db6d),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Text(
                  TranslationConstants.FIND_INSPIRATION,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          StreamBuilder<List<StoryEntity>>(
            stream: _storyController.storyList.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return   Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 180,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      itemCount: snapshot?.data?.length,
                      padding: EdgeInsets.all(5),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 260,
                      ), itemBuilder: (context, index) {
                      return StoryTileWidget(index, snapshot.data![index]);
                    },),
                  ),
                );
              }else{
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

            },
          ),

        ],
      ),
    );
  }
}





