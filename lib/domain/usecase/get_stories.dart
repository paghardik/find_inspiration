import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';

class GetStories {
  final StoryRepository _storyRepository;

  GetStories(this._storyRepository);

  Stream<List<StoryEntity>> call() async* {
    yield* _storyRepository.storyListStream();
  }

}