import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project/core/model/category_model.dart';
import 'package:project/core/model/meal_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryDate() async {
    // 加载 json 文件
    String stringResult =
        await rootBundle.loadString("assets/json/category.json");
    // 将json-string转换成map/list
    final result = json.decode(stringResult);

    // 将 map 转化为对象
    final resultList = result["category"];

    List<CategoryModel> category = [];

    for (var json in resultList) {
      category.add(CategoryModel.fromJson(json));
    }
    return category;
  }

  static Future<List<Meal>> getMealData() async {
    // 加载 json 文件
    String stringResult = await rootBundle.loadString("assets/json/meal.json");
    // 将json-string转换成map/list
    final result = json.decode(stringResult);

    // 将 map 转化为对象
    final resultList = result["meal"];

    List<Meal> meal = [];

    for (var json in resultList) {
      meal.add(Meal.fromJson(json));
    }
    return meal;
  }
}
