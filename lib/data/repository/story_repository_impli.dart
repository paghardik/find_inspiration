import 'dart:io';

import 'package:find_inspiration/data/datasources/story_local_data_source.dart';
import 'package:find_inspiration/data/datasources/story_remote_data_source.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';

class StoryRepositoryImpl extends StoryRepository{
  final StoryLocalDataSource localDataSource;
  final StoryRemoteDataSource storyRemoteDataSource;

  StoryRepositoryImpl(this.localDataSource, this.storyRemoteDataSource);

  @override
  Future<List<StoryEntity>> storyList() {
    return localDataSource.storyList();
  }

  @override
  Stream<List<StoryEntity>> storyListStream() {
    return localDataSource.storyListStream();
  }

  @override
  Future<String> uploadImage(File file) {
    return storyRemoteDataSource.uploadImage(file);
  }

}