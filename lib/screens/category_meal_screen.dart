import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'Category_meals';

  final List<Meal> availableMeals;


  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String ,String>;
    final categoryId=routeArg['id'];
    categoryTitle=routeArg['title'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }
    ).toList();
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id== mealId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(imageUrl: categoryMeals[index].imageUrl,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
          duration: categoryMeals[index].duration,
          title: categoryMeals[index].title,
          id: categoryMeals[index].id,
          );
        },
        itemCount:categoryMeals.length ,
      ),
    );
  }
}
