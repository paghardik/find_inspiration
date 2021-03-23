import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/presentation/ui/component/name_widget.dart';
import 'package:find_inspiration/presentation/ui/component/price_widget.dart';
import 'package:find_inspiration/presentation/ui/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryTileWidget extends StatelessWidget {
  final StoryController _storyController = Get.find<StoryController>();
  final int index;
  final StoryEntity storyEntity;
  StoryTileWidget(
  this.index, this.storyEntity,{Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _storyController.moveToDisplayStory(index);
      },
      child: Container(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: storyEntity.imageUrl!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    /*colorFilter:
                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)*/),
                ),
              ),
              placeholder: (context, url) => Container(child: Center(child: CircularProgressIndicator(),),),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            PriceWidget(price: storyEntity.price,),
            FoodNameWidget(title: storyEntity.title)
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}