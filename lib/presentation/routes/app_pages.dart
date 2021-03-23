import 'package:find_inspiration/presentation/routes/app_routes.dart';
import 'package:find_inspiration/presentation/ui/display_Story/display_story.dart';
import 'package:find_inspiration/presentation/ui/landing/landing_screen.dart';
import 'package:find_inspiration/presentation/ui/main/main_screen.dart';
import 'package:get/get.dart';

class AppPages{

  static const INITIAL = AppRoutes.LANDING;

  static List<GetPage> appPages = [
    GetPage(name: AppRoutes.LANDING, page: () => LandingScreen()),
    GetPage(name: MainScreen.ROUTE_NAME, page: () => MainScreen()),
    GetPage(name: DisplayStory.ROOT_NAME, page: () => DisplayStory())
  ];
}