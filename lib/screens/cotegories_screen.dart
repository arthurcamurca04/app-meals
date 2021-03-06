import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/cotegory_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

        children: DUMMY_CATEGORIES.map((category){
          return CategoryWidget(category);
        }).toList(),
      );
  }
}
