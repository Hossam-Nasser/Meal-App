import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tab_screen.dart';
import './screens/category_meal_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters ={
   'gluten':false,
   'lactose':false,
   'vegan':false,
   'vegetarian':false,
  };

  List<Meal> _availableMeals= DUMMY_MEALS;
  List<Meal> _favoriteMeals= [];

  void _setFilters(Map<String, bool> _filterData){
      setState(() {
        _filters =_filterData;

        _availableMeals = DUMMY_MEALS.where((meal) {
          if(_filters['gluten']==true && meal.isGlutenFree ==false){
            return false;
          }
          if(_filters['lactose']==true && meal.isLactoseFree ==false){
            return false;
          }
          if(_filters['vegan']==true && meal.isVegan ==false){
            return false;
          }
          if(_filters['vegetarian']==true && meal.isVegetarian ==false){
            return false;
          }
          return true;
        }).toList();
      });
  }

  void _toggleFavorite(String meadId){
    final _existingIndex=_favoriteMeals.indexWhere((meal) => meal.id==meadId);

    if(_existingIndex >=0){
      setState(() {
        _favoriteMeals.removeAt(_existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==meadId));
      });
    }
  }

  bool isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1)
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1)
          ),
          title: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        )
      ),
      //home:MyHomePage(),

      routes: {
        '/':(context)=> TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName :(context) => CategoryMealScreen(_availableMeals),
        MealDetailsScreen.routeName :(context) => MealDetailsScreen(_toggleFavorite,isMealFavorite),
        Filters.routName :(context) => Filters(_filters,_setFilters)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
