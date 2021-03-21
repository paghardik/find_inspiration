import 'package:find_inspiration/domain/entities/story_entity.dart';

abstract class StoryRepository{
  Future<List<StoryEntity>> storyList();
  Stream<List<StoryEntity>> storyListStream();

}