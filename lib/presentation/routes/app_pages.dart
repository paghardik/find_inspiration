import 'package:find_inspiration/presentation/routes/app_routes.dart';
import 'package:find_inspiration/presentation/ui/landing/landing_screen.dart';
import 'package:get/get.dart';

class AppPages{

  static const INITIAL = AppRoutes.LANDING;

  static List<GetPage> appPages = [
    GetPage(name: AppRoutes.LANDING, page: () => LandingScreen())
  ];
}