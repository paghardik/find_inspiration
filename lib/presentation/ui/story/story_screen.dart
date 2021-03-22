import 'dart:ui';

import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/presentation/ui/create_story/controller/create_story_controller.dart';
import 'package:find_inspiration/presentation/ui/story/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryScreen extends StatelessWidget {
  StoryController _storyController = Get.put(StoryController());

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
                  TranslationConstants.CREATE_STORY,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          StreamBuilder<List<StoryEntity>>(
            stream: _storyController.storyList.stream,
            builder: (context, snapshot) {
              return   Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 180,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: snapshot.data.length,
                    padding: EdgeInsets.all(5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 260,
                    ), itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data[index].imageUrl),
                              ),
                            ),
                          ),
                          PriceWidget(price: snapshot.data[index].price,),
                          FoodNameWidget(title: snapshot.data[index].title)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                    );
                  },),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}

class FoodNameWidget extends StatelessWidget {
  final String title;
  const FoodNameWidget({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        child: Stack(
          children: [
          Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title, textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,),
            ),
          ),
          )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black26, Colors.transparent]
            )
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final String price;
  const PriceWidget({
    Key key, this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  price.replaceFirst(" ", "\n"), textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
