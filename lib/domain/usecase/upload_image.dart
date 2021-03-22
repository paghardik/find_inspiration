
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:find_inspiration/domain/entities/app_error.dart';
import 'package:find_inspiration/domain/entities/no_params.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';
import 'package:find_inspiration/domain/usecase/usecase.dart';

class UploadImage extends UseCase<String, File> {
  final StoryRepository _storyRepository;

  UploadImage(this._storyRepository);

  @override
  Future<Either<AppError, String>> call(File file) async {
    return _storyRepository.uploadImage(file);
  }

}