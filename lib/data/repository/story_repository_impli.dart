import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';

class StoryRepositoryImpl extends StoryRepository{
  @override
  Future<List<StoryEntity>> storyList() {
    // TODO: implement storyList
    throw UnimplementedError();
  }

  @override
  Stream<List<StoryEntity>> storyListStream() {
    // TODO: implement storyListStream
    throw UnimplementedError();
  }

}