import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'routing/routing.dart';

import 'view/meal_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Meal List',
      getPages: appRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 213, 194, 15)),
        useMaterial3: true,
      ),
      home: const MealListView(),
    );
  }
}
