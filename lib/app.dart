import 'package:flutter/material.dart';
import 'package:project/core/router/index.dart';
import 'package:project/ui/shared/theme/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "小鱼美食",
      theme: ThemeData.light(),
      // 普通模式
      darkTheme: ThemeData.dark(),
      // 暗黑模式
      routes: ProjectRoute.routes,
      // 路由映射表
      initialRoute: ProjectRoute.initialRoute,
      // 默认启动路由
      onGenerateRoute: ProjectRoute.generateRoute,
      // 路由跳转映射
      onUnknownRoute: ProjectRoute.unknownRoute, // 404 页面
    );
  }
}
