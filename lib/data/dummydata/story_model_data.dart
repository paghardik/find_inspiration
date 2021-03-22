import 'package:find_inspiration/data/models/story_model.dart';

class StoryDummyData {
  @override
  Future<List<StoryModel>> call() async {
    return [
      StoryModel("Shibuya Sushi", "18 CHF", "assets/pngs/img1.jpg"),
      StoryModel("Super Salad", "12 CHF", "assets/pngs/img2.jpg"),
      StoryModel("Angelo", "17 CHF", "assets/pngs/img3.jpg"),
      StoryModel("Shibuya Sushi", "18 CHF", "assets/pngs/img1.jpg"),
      StoryModel("Super Salad", "12 CHF", "assets/pngs/img2.jpg"),
      StoryModel("Angelo", "17 CHF", "assets/pngs/img3.jpg"),
      StoryModel("Shibuya Sushi", "18 CHF", "assets/pngs/img1.jpg"),
      StoryModel("Super Salad", "12 CHF", "assets/pngs/img2.jpg"),
      StoryModel("Angelo", "17 CHF", "assets/pngs/img3.jpg"),
      StoryModel("Shibuya Sushi", "18 CHF", "assets/pngs/img1.jpg"),
      StoryModel("Super Salad", "12 CHF", "assets/pngs/img2.jpg"),
      StoryModel("Angelo", "17 CHF", "assets/pngs/img3.jpg"),
    ];
  }
}
