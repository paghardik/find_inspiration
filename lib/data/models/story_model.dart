import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity{
  String? title;//
  String? price;
  String? imageUrl;

  StoryModel({this.title, this.price, this.imageUrl}): super(title: title, price: price, imageUrl: imageUrl);

  StoryModel.fromJson(Map<String, dynamic> json) {
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

  static StoryModel fromSnapshot(DocumentSnapshot snapshot){
    return StoryModel(
      title: snapshot.data()?["title"],
      price: snapshot.data()?["price"],
      imageUrl: snapshot.data()?["imageUrl"],
    );
  }

}