import 'package:flutter/material.dart';
import 'package:project/ui/pages/main/navigation/tab_items.dart';
import 'package:project/ui/shared/theme/index.dart';

class Main extends StatefulWidget {
  static const String routeName = "/"; // 路由别名

  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;


  /// 页面切换
  void navitemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: ProjectTheme.smallFontSize,   // 选中时文字大小（可选参数）
        unselectedFontSize: ProjectTheme.smallFontSize, // 未选中时文字大小（可选参数）
        // selectedItemColor: ,   // 选中时文字颜色（可选参数）
        // unselectedItemColor: , // 未选中时文字颜色（可选参数）
        backgroundColor: Theme.of(context).canvasColor,
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => navitemTap(index),
      ),
    );
  }
}
