import 'dart:convert';

// JSON'dan MealListModel nesnesine dönüştürme fonksiyonu
MealListModel mealListModelFromJson(String str) => MealListModel.fromJson(json.decode(str));

// MealListModel nesnesini JSON formatına dönüştürme fonksiyonu
String mealListModelToJson(MealListModel data) => json.encode(data.toJson());

class MealListModel {
  List<Categories>? categories;

  MealListModel({this.categories});

  // JSON'dan MealListModel nesnesi oluşturma
  factory MealListModel.fromJson(Map<String, dynamic> json) {
    return MealListModel(
      categories: json['categories'] != null
          ? List<Categories>.from(json['categories'].map((x) => Categories.fromJson(x)))
          : null,
    );
  }

  // MealListModel nesnesini JSON formatına dönüştürme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Categories({this.idCategory, this.strCategory, this.strCategoryThumb, this.strCategoryDescription});

  // JSON'dan Categories nesnesi oluşturma
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }

  // Categories nesnesini JSON formatına dönüştürme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCategory'] = idCategory;
    data['strCategory'] = strCategory;
    data['strCategoryThumb'] = strCategoryThumb;
    data['strCategoryDescription'] = strCategoryDescription;
    return data;
  }
}
