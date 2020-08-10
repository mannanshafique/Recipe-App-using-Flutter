import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/Models/CategoryModel.dart';

class CategoryFood {
  List<Categories> categories = [];

  Future<void> getCategories() async {
    String url = "https://www.themealdb.com/api/json/v1/1/categories.php";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData['categories'].forEach((element) {
      Categories categoriesModel = Categories(
        idCategory: element['idCategory'],
        strCategory: element['strCategory'],
        strCategoryDescription: element['strCategoryDescription'],
        strCategoryThumb: element['strCategoryThumb'],
      );
      categories.add(categoriesModel);
    });
  }
}
