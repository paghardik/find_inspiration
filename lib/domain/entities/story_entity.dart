import 'package:find_inspiration/data/models/story_model.dart';

class StoryEntity {
  String? title;
  String? price;
  String? imageUrl;


  StoryEntity({this.title, this.price, this.imageUrl});

  StoryEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  static  StoryEntity fromStoryModel(StoryModel storyModel){
    return  StoryEntity(
      title: storyModel.title,
      price: storyModel.price,
      imageUrl: storyModel.imageUrl
    );
  }

}