import 'package:flutter/material.dart';
import 'package:project/ui/pages/detail/index.dart';
import 'package:project/ui/pages/info/index.dart';
import 'package:project/ui/pages/main/index.dart';

class ProjectRoute {
  static final Map<String, WidgetBuilder> routes = {
    Main.routeName: (ctx) => const Main(),
    Detail.routeName: (ctx) => const Detail(),
    Info.routeName: (ctx) => const Info()
  };

  /// 初始路由
  static const String initialRoute = Main.routeName;

  /// 路由
  static RouteFactory generateRoute = (setting) {
    return null;
  };

  /// 404 路由
  static RouteFactory unknownRoute = (setting) {
    return MaterialPageRoute(builder: (ctx) {
      return const Text("404页面");
    });
  };
}
