
import 'dart:io';

import 'package:find_inspiration/domain/repository/story_repository.dart';

class UploadImage {
  final StoryRepository _storyRepository;

  UploadImage(this._storyRepository);

  Future<String> call(File file) async {
    return _storyRepository.uploadImage(file);
  }

}