import 'package:find_inspiration/presentation/ui/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/story_controller.dart';
import 'widgets/story_view.dart';

class DisplayStory extends StatefulWidget {
  static const ROOT_NAME = "/displaystory";
  StoryController storyController = Get.find<StoryController>();

  @override
  _DisplayStoryState createState() => _DisplayStoryState();
}

class _DisplayStoryState extends State<DisplayStory> {
  final storyController = DisplayStoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: widget.storyController.storyList.toList().map((story) =>
            StoryItem.pageImage(url: story.imageUrl!,
                controller: storyController,
                price: story.price,
                title: story.title)).toList(),
        /*storyItems: [
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url:
            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            price: "Still sampling",
            title: "Test title",
            controller: storyController,
          )
        ]*/
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
