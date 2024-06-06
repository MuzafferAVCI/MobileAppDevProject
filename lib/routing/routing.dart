import '../binding/initial_binding.dart';
import '../view/meal_detailview.dart';

import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/detail',
        page: () => const MealDetailView(),
        binding: InitialBinding(),
      ),
    ];
