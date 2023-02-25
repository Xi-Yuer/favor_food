import 'package:flutter/material.dart';
import 'package:project/core/model/category_model.dart';
import 'package:project/core/model/meal_model.dart';
import 'package:project/core/store/meal.dart';
import 'package:project/ui/widgets/mealtem/index.dart';
import 'package:provider/provider.dart';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show ListEquality;

class Detail extends StatelessWidget {
  static String routeName = "/detail";

  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 获取路由传递过来的数据
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: buildContent(category));
  }

  Widget buildContent(CategoryModel category) {
    // 两个泛型 第一个是原始类型，第二个是返回类型
    return Selector<MealStore, List<Meal>>(
        // selector 返回的类型需要和第二个泛型保持一致，可以在这里对数据进行过滤转化等操作再将数据返回
        selector: (ctx, meal) => meal.meals
            // ignore: iterable_contains_unrelated_type
            .where((element) => element.categories.contains(category.id))
            .toList(),
        shouldRebuild: (pre, next) => !const ListEquality().equals(pre, next),
        // 比较两个 list 内容是否相同
        builder: (ctx, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (ctx, index) => MealItem(meal: value[index]),
          );
        });
  }
}
