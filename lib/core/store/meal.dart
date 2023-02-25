import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:project/core/model/meal_model.dart';
import 'package:project/core/service/json_parser.dart';

class MealStore extends ChangeNotifier {
  List<Meal> _mealList = [];

  List<Meal> get meals {
    return _mealList;
  }

  MealStore() {
    getData();
  }

  getData() async {
    _mealList = await JsonParse.getMealData();
    notifyListeners();
  }
}
