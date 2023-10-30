import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  List<Meal> displayedMeals;
  MealDetailScreen(this.displayedMeals);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final mealSelected = displayedMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealSelected.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              mealSelected.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingridients',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          Container(
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.amber,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${mealSelected.ingredients[index]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              itemCount: mealSelected.ingredients.length,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Steps',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          Container(
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('${mealSelected.steps[index]}'),
                    ),
                    const Divider(
                      color: Colors.black12,
                    )
                  ],
                );
              },
              itemCount: mealSelected.steps.length,
            ),
          ),
        ]),
      ),
    );
  }
}
