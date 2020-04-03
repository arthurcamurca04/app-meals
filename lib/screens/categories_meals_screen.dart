import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../components/meal_widget.dart';

class CategoriesMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Category category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index){

          return MealWidget(categoryMeals[index]);
        },
      ),
    );
  }
}