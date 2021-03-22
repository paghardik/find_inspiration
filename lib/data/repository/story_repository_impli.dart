import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_inspiration/data/datasources/story_local_data_source.dart';
import 'package:find_inspiration/data/datasources/story_remote_data_source.dart';
import 'package:find_inspiration/data/models/story_model.dart';
import 'package:find_inspiration/domain/entities/add_story.dart';
import 'package:find_inspiration/domain/entities/app_error.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class StoryRepositoryImpl extends StoryRepository {
  final StoryLocalDataSource localDataSource;
  final StoryRemoteDataSource storyRemoteDataSource;

  StoryRepositoryImpl(this.localDataSource, this.storyRemoteDataSource);

  @override
  Future<List<StoryEntity>> storyList() {
    return localDataSource.storyList();
  }

  @override
  Stream<List<StoryEntity>> storyListStream() {
    return storyRemoteDataSource.getStory().map((snapshot) {
      return snapshot.docs.map(
          (doc) => StoryEntity.fromStoryModel(StoryModel.fromSnapshot(doc))).toList();
    }).asBroadcastStream();

  }

  @override
  Future<Either<AppError, String>> uploadImage(File file) async {
    try {
      final response = await storyRemoteDataSource.uploadImage(file);
      final downloadUrl = await response.ref.getDownloadURL();
      print("Download Url ${downloadUrl}");
      return Right(downloadUrl);
    } on FirebaseException catch (e) {
      print(e.message);
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, bool>> addStory(AddStory addStory) async {
    try {
      final response = await storyRemoteDataSource.addStory(addStory);
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(AppError(AppErrorType.network));
    }
    /*return await storyRemoteDataSource.addStory(addStory).then((value) {
       Right(true);
    }).catchError((error) {

    });*/
  }
}
