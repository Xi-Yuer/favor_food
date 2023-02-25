import 'package:flutter/material.dart';
import 'package:project/core/model/meal_model.dart';
import 'package:project/ui/pages/info/index.dart';
import 'package:project/ui/shared/Complexity/index.dart';
import 'package:project/ui/shared/px/index.dart';
import 'package:project/ui/shared/theme/index.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.0.px), // 外边距
        elevation: 5, // 阴影
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.px),
        ), // 卡片圆角
        child: Column(
          children: [buildImageAndTitle(), buildOperationBtn()],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(Info.routeName, arguments: meal);
      },
    );
  }

  Widget buildImageAndTitle() {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0.px),
              topRight: Radius.circular(12.0.px),
            ),
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 250.0.px,
              fit: BoxFit.cover,
            )),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            width: 300.0.px,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.0.px)),
            padding: EdgeInsets.all(10.0.px),
            child: Text(
              meal.title,
              style: const TextStyle(
                fontSize: ProjectTheme.miniFontSize,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationBtn() {
    return Padding(
      padding: EdgeInsets.all(16.0.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildOperationItem(const Icon(Icons.schedule), "${meal.duration}分钟"),
          buildOperationItem(const Icon(Icons.restaurant),
              "${getComplexityText(meal.complexity)}难度"),
          buildOperationItem(const Icon(Icons.favorite_border), "未收藏"),
          // Row()
        ],
      ),
    );
  }

  Widget buildOperationItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        Text(
          title,
          style: const TextStyle(fontSize: ProjectTheme.miniFontSize),
        )
      ],
    );
  }
}
