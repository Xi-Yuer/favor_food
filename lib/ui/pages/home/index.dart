import 'package:flutter/material.dart';
import 'package:project/ui/pages/home/category.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
      ),
      body: const CateGory(),
    );
  }
}
