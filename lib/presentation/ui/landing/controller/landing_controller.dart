import 'package:find_inspiration/presentation/ui/main/main_screen.dart';
import 'package:get/get.dart';

class LandingController extends GetxController{

  @override
  void onInit() async{
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    moveToMainScreen();
  }

  moveToMainScreen() {
    Get.offAllNamed(MainScreen.ROUTE_NAME);
  }

}