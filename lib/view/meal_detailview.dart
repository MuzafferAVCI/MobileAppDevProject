// meal_detail_view.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constant/text_constant.dart';
import '../controller/meal_list_controller.dart';

import '../widget/custom_detail_widget.dart';

class MealDetailView extends GetView<MealListController> {
  const MealDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextConstant textConstant = TextConstant();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final selectedCategory = controller.selectedCategory.value;
          return Text(selectedCategory?.strCategory ?? textConstant.noCategorySelected);
        }),
      ),
      body: Obx(() {
        final selectedCategory = controller.selectedCategory.value;
        if (selectedCategory != null) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SizedBox(child: Image(image: NetworkImage(selectedCategory.strCategoryThumb!))),
              CustomDetailWidget(title: textConstant.id, value: selectedCategory.idCategory),
              CustomDetailWidget(title: textConstant.name, value: selectedCategory.strCategory),
              CustomDetailWidget(title: textConstant.description, value: selectedCategory.strCategoryDescription),
            ],
          );
        } else {
          return Center(
            child: Text(textConstant.noCategorySelected),
          );
        }
      }),
    );
  }
}
