import 'package:find_inspiration/domain/entities/story_entity.dart';

class StoryModel extends StoryEntity{
  final String title;
  final String price;
  final String imageUrl;

  StoryModel(this.title, this.price, this.imageUrl) : super(title, price, imageUrl);
}