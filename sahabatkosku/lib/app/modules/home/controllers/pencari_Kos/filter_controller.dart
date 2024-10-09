import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FilterController extends GetxController {
  var selectedGender = ''.obs;
  var paymentOption = ''.obs;
  var isNotificationEnabled = false.obs;

  void resetFilters() {
    selectedGender.value = '';
    paymentOption.value = '';
  }
}
