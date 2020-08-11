import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:recipe_app/Models/FilterCategory.dart';

class CategoryFood {
  List<FilterCategory> filtercategories = [];

  Future<void> getFilterCategories(String categoryName) async {
    String url =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData['meals'].forEach((element) {
      FilterCategory filtercategoriesModel = FilterCategory(
        idMeal: element['idMeal'],
        strMeal: element['strMeal'],
        strMealThumb: element['strMealThumb'],
      );
      filtercategories.add(filtercategoriesModel);
    });
  }
}
