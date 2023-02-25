import 'package:flutter/material.dart';
import 'package:project/ui/pages/favor/index.dart';
import 'package:project/ui/pages/home/index.dart';

// 页面page

final List<Widget> pages = [
  const Home(),
  const Favor(),
];

// 导航tabs
final List<BottomNavigationBarItem> tabs = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    tooltip: "首页",
    label: "首页",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    tooltip: "收藏",
    label: "收藏",
  ),
];
