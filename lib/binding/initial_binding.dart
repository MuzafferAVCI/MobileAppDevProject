import 'package:get/get.dart';

import '../controller/meal_list_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MealListController());
  }
}
