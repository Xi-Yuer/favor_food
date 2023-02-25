import 'package:flutter/material.dart';
import 'package:project/core/store/meal.dart';
import 'package:provider/provider.dart';

import 'app.dart';

main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<MealStore>(
          create: (context) => MealStore(),
        ),
      ],
      child: const App(),
    ));
