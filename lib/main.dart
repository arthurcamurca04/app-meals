import 'package:app_meals/models/settings.dart';
import 'package:flutter/material.dart';
import './screens/cotegories_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_details.dart';
import './utils/app_routes.dart';
import './screens/tabs_screen.dart';
import './screens/settings_screen.dart';
import './models/meal.dart';
import './data/dummy_data.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      
      _availableMeals = DUMMY_MEALS.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian&& !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;

      }).toList();
    });
  }

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
        AppRoutes.CATEGORY_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAILS: (ctx) => MealDetails(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
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
