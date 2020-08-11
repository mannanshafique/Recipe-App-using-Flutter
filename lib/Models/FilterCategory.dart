// To parse this JSON data, do
//
//     final filterCategory = filterCategoryFromJson(jsonString);

import 'dart:convert';

FilterCategory filterCategoryFromJson(String str) =>
    FilterCategory.fromJson(json.decode(str));

String filterCategoryToJson(FilterCategory data) => json.encode(data.toJson());

class FilterCategory {
  FilterCategory({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory FilterCategory.fromJson(Map<String, dynamic> json) => FilterCategory(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
