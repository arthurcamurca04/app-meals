import 'package:flutter/material.dart';
import './screens/cotegories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_details.dart';
import './utils/app_routes.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetails()
      },
      onUnknownRoute: (settins) {
        return MaterialPageRoute(
          builder: (_){
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
