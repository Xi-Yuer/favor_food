import 'package:flutter/material.dart';
import 'package:project/core/model/meal_model.dart';
import 'package:project/ui/shared/px/index.dart';
import 'package:project/ui/shared/theme/index.dart';

class Info extends StatelessWidget {
  static const routeName = "/info";

  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(meal.title),
      // ),
      body: buildContent(context, meal),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget buildContent(context, Meal meal) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBanner(context, meal),
          buildTitle("制作材料"),
          buildMake(meal),
          buildTitle("制作步骤"),
          buildStep(meal),
        ],
      ),
    );
  }

  // 横幅图片
  Widget buildBanner(BuildContext context, Meal meal) {
    return Stack(
      children: [
        Image.network(meal.imageUrl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.px),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          color: Colors.black12,
          height: 55.0.px,
          margin: EdgeInsets.only(top: SizeFit.statusHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                meal.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0.px,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // 制作材料
  Widget buildMake(Meal meal) {
    return buildContentWrapper(buildMakeList(meal));
  }

  Container buildContentWrapper(Widget child) {
    return Container(
      padding: EdgeInsets.all(5.0.px),
      margin: EdgeInsets.all(15.0.px),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0.px),
      ),
      child: child,
    );
  }

  ListView buildMakeList(Meal meal) {
    return ListView.builder(
      shrinkWrap: true,
      // 该属性是让 listview的高度随着子元素的高度一致
      physics: const NeverScrollableScrollPhysics(),
      // 默认 listview 中的内容是可以滚动的，该属性可以禁止listview滚动
      itemCount: meal.ingredients.length,
      itemBuilder: (ctx, index) {
        return Card(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.all(2.0.px),
            child: Text(
              meal.ingredients[index],
            ),
          ),
        );
      },
    );
  }

  // 制作步骤
  Widget buildStep(Meal meal) {
    return buildContentWrapper(buildStepList(meal));
  }

  Widget buildStepList(Meal meal) {
    return ListView.separated(
      shrinkWrap: true,
      // 该属性是让 listview的高度随着子元素的高度一致
      physics: const NeverScrollableScrollPhysics(),
      // 默认 listview 中的内容是可以滚动的，该属性可以禁止listview滚动
      itemCount: meal.steps.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("#${index + 1}"),
          ),
          title: Text(meal.steps[index]),
        );
      },
      separatorBuilder: (ctx, index) {
        // 分割线
        return const Divider();
      },
    );
  }

  // 标题
  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0.px,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: ProjectTheme.miniFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
