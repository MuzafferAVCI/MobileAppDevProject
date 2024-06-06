import 'package:get/get.dart';

import '../model/meal_list_model.dart';
import '../service/meal_list_service.dart';

class MealListController extends GetxController {
  // Kategoriler listesi için observable bir değişken
  RxList<Categories> mealListModel = <Categories>[].obs;

  // Seçilen kategori için observable bir değişken
  Rx<Categories?> selectedCategory = Rx<Categories?>(null);

  final MealListApiService _apiService = MealListApiService();

  // Controller başlatıldığında çağrılan fonksiyon
  @override
  void onInit() {
    super.onInit();
    // Kategori verilerini API'den çek
    getMealListData();
  }

  // API'den kategori verilerini çekmek için kullanılan asenkron fonksiyon
  Future<void> getMealListData() async {
    try {
      final mealList = await _apiService.getMealList();
      if (mealList != null && mealList.categories != null) {
        // Gelen verileri observable listeye atar
        mealListModel.assignAll(mealList.categories!);
      }
    } catch (e) {
      // Hata durumunda bir bildirim gösterir
      Get.snackbar('Error', e.toString());
    }
  }

  // Seçilen kategoriyi ayarlamak için kullanılan fonksiyon
  void setSelectedCategory(Categories category) {
    selectedCategory.value = category;
  }
}
