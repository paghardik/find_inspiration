import 'package:dartz/dartz.dart';
import 'package:find_inspiration/domain/entities/add_story.dart';
import 'package:find_inspiration/domain/entities/app_error.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';
import 'package:find_inspiration/domain/usecase/usecase.dart';

class AddStores extends UseCase<bool, AddStory>{

  final StoryRepository _storyRepository;

  AddStores(this._storyRepository);

  @override
  Future<Either<AppError, bool>> call(AddStory addStory) async{
    return await _storyRepository.addStory(addStory);
  }

}