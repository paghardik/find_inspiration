import 'dart:io';

import 'package:find_inspiration/domain/entities/story_entity.dart';

abstract class StoryRepository{
  Future<String> uploadImage(File file);
  Future<List<StoryEntity>> storyList();
  Stream<List<StoryEntity>> storyListStream();

}