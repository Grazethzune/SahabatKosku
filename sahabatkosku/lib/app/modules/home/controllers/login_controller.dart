import 'package:get/get.dart';

class LoginController extends GetxController {
  // Reactive variable for tab selection
  var selectedTab = 'Pencari Kos'.obs;

  // Method to select a tab
  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}
