import 'package:find_inspiration/data/datasources/story_local_data_source.dart';
import 'package:find_inspiration/data/datasources/story_remote_data_source.dart';
import 'package:find_inspiration/data/repository/story_repository_impli.dart';
import 'package:find_inspiration/domain/entities/story_entity.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';
import 'package:find_inspiration/domain/usecase/get_stories.dart';
import 'package:find_inspiration/presentation/ui/display_Story/display_story.dart';
import 'package:get/get.dart';

class StoryController extends GetxController{

  StoryRepository? _storyRepository;
  StoryLocalDataSource? _storyLocalDataSource;
  StoryRemoteDataSource? _storyRemoteDataSource;
  GetStories? _getStories;

  RxList<StoryEntity> storyList= RxList<StoryEntity>();

  int selectedStoryIndex = 0;

  @override
  void onInit() async{
    super.onInit();

    _storyLocalDataSource = StoryLocalDataSourceImpl();
    _storyRemoteDataSource = StoryRemoteDataSourceImpl();
    _storyRepository =
        StoryRepositoryImpl(_storyLocalDataSource!, _storyRemoteDataSource!);
    _getStories = GetStories(_storyRepository!);

    Future.delayed(Duration(seconds: 3));
    getStory();
  }

  void getStory() {
    storyList.bindStream(_getStories!.call());
  }

  void moveToDisplayStory(int index){
    selectedStoryIndex = index;
    Get.toNamed(DisplayStory.ROOT_NAME);
  }

}