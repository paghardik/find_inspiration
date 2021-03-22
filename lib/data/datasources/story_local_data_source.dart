import 'package:find_inspiration/data/dummydata/story_model_data.dart';
import 'package:find_inspiration/data/models/story_model.dart';

abstract class StoryLocalDataSource{
  Future<List<StoryModel>> storyList();
  Stream<List<StoryModel>> storyListStream();
}

class StoryLocalDataSourceImpl extends StoryLocalDataSource{
  @override
  Future<List<StoryModel>> storyList() async{
    Future.delayed(Duration(seconds: 2));
    return StoryDummyData().call();
  }

  @override
  Stream<List<StoryModel>> storyListStream() async*{
    yield* Stream.fromFuture(StoryDummyData().call());
  }

}