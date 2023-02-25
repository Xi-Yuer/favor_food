import 'package:flutter/material.dart';
import 'package:project/ui/shared/px/index.dart';

class Favor extends StatelessWidget {
  const Favor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的收藏"),
      ),
      body: Center(
        child: Container(
          width: 200.0.px,
          height: 200.0.px,
          color: Colors.orange,
        ),
      ),
    );
  }
}
