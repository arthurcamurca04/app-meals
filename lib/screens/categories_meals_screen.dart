import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_widget.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealWidget(categoryMeals[index]);
        },
      ),
    );
  }
}
