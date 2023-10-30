import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/category.dart';
import './screens/meal_detail.dart';
import './screens/tabs_screen.dart';
import './screens/categories.dart';
import './screens/filter_screen.dart';
import './screens/tabs_bottom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData(
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  List<Meal> _displayedMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _saveFilter(Map<String, bool> f) {
    setState(() {
      _filters = f;

      _displayedMeals = _displayedMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      print(_displayedMeals);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MealDils",
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.pink, secondary: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        //'/': (context) => TabsScreen(),
        '/': (context) => TabsBottomScreen(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_displayedMeals),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filter: _filters, saveFilter: _saveFilter),
      },
    );
  }
}
