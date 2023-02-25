import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/core/service/json_parser.dart';
import 'package:project/ui/pages/detail/index.dart';
import 'package:project/ui/shared/theme/index.dart';

class CateGory extends StatelessWidget {
  const CateGory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder(
          future: JsonParse.getCategoryDate(),
          builder: (ctx, snapshot) {
            // future 正在加载，还没有数据时
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // future 加载失败
            if (snapshot.hasError) {
              return const Center(child: Text("加载失败！"));
            }
            // future 加载成功
            final category = snapshot.data;
            return GridView.builder(
                itemCount: category?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return buildContainerItem(context, category?[index]);
                });
          }),
    );
  }

  Widget buildContainerItem(context, category) {
    final random = Random();
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(
              100,
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
            ),
            gradient: LinearGradient(colors: [
              Color.fromARGB(
                120,
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
              ),
              Color.fromARGB(
                255,
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
              )
            ]),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 0.1,
            )),
        child: Text(
          category.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ProjectTheme.miniFontSize,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(Detail.routeName, arguments: category);
      },
    );
  }
}
