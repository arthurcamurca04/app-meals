import 'package:flutter/material.dart';
import 'cotegories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreeIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavoriteScreen()},
  ];

  _selectScreen(int index){
    setState(() {
      _selectedScreeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreeIndex]['title']),
      ),
      body: _screens[_selectedScreeIndex]['screen'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          )
        ],
      ),
    );
  }
}
