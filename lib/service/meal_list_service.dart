import 'dart:developer';
import 'package:http/http.dart' as http;

import '../constant/api_constant.dart';
import '../model/meal_list_model.dart';

class MealListApiService {
  Future<MealListModel?> getMealList() async {
    try {
      var url = Uri.parse(ApiConstant().baseUrl + ApiConstant().endPointCategories);
      var response = await http.get(url);

      //işlem başarılı ise yani statusCode = 200 ise
      if (response.statusCode == 200) {
        //Bizim modele response'un içeriğini yani datayı gönderiyoruz.
        //Ve o list'i "model" diye oluşturdugumuz listeye aktarıyoruz.
        MealListModel model = mealListModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      //bir hata olursa bize söyleyecek
      log(e.toString());
    }
    return null;
  }
}
