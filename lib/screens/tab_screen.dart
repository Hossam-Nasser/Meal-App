import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/drawer_item.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;


  TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;

  @override
  void initState(){
    _pages= [
      {
        "page":CategoriesScreen(),
        "title":"Categories"
      },
      {
        "page":FavouriteScreen(widget.favoriteMeal),
        "title":"your Favourite"
      }
    ];
    super.initState();
  }

  int _selectItems=0;
  void selectTap(int value) {
    setState(() {
      _selectItems=value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectItems]["title"]),
      ),
      body: _pages[_selectItems]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectTap,
        currentIndex: _selectItems,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            title:Text("categories"),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite),
            title:Text("favorite"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
