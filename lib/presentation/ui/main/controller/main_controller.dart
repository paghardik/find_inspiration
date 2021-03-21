import 'package:find_inspiration/presentation/ui/main/components/bottom_app_bar_item.dart';
import 'package:find_inspiration/presentation/ui/main/components/selected_item.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

  var selectedItem = SelectedItem(BottomItem.STORY).obs;

  selectTab(BottomItem selectedTab) {
    selectedItem.value = SelectedItem(selectedTab);
  }

  @override
  void onInit() {
    super.onInit();
    selectedItem.value = SelectedItem(BottomItem.STORY);
  }


  @override
  void dispose() {
    super.dispose();
  }
}
