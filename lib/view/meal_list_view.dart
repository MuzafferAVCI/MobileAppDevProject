import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/meal_list_controller.dart';

class MealListView extends StatelessWidget {
  const MealListView({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX kullanarak MealListController'ın otomatik olarak bulunmasını ve bağlanmasını sağlar
    // Bu satır, Get.find kullanarak MealListController'ı bulmak için yorumlanmıştır, çünkü GetX widget'ı zaten kontrolörün bağlanmasını sağlar

    return Scaffold(
      appBar: AppBar(
        title: const Text("The Meal List"), // AppBar başlığı
      ),
      body: GetX<MealListController>(
        // GetX widget'ı, MealListController'ı bağlayarak ve değişiklikleri dinleyerek arayüzün otomatik olarak güncellenmesini sağlar
        builder: (controller) {
          return ListView.builder(
            // Listedeki öğe sayısını kontrolörden alır
            itemCount: controller.mealListModel.length,
            itemBuilder: (context, index) {
              // Mevcut kategoriyi kontrolörden alır
              final category = controller.mealListModel[index];
              return Card(
                child: ListTile(
                  // Kategorinin küçük resmini gösterir, varsa
                  leading: category.strCategoryThumb != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(category.strCategoryThumb!),
                        )
                      : null,
                  // Kategorinin adını gösterir
                  title: Text(category.strCategory ?? ''),
                  onTap: () {
                    // Seçilen kategoriyi kontrolöre bildirir
                    controller.setSelectedCategory(category);
                    // Kategori detayları sayfasına geçiş yapar
                    Get.toNamed('/detail');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
