import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_inspiration/domain/entities/add_story.dart';
import 'package:find_inspiration/domain/entities/app_error.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';

abstract class StoryRepository{
  Future<Either<AppError, bool>> addStory(AddStory addStory);
  Future<Either<AppError, String>> uploadImage(File file);
  Future<List<StoryEntity>> storyList();
  Stream<List<StoryEntity>> storyListStream();

}