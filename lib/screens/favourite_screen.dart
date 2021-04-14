import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/drawer_item.dart';
import '../widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeal.isEmpty) {
      return Center(
        child: Text("You have no favourite yet - start adding some!"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(imageUrl: favouriteMeal[index].imageUrl,
            complexity: favouriteMeal[index].complexity,
            affordability: favouriteMeal[index].affordability,
            duration: favouriteMeal[index].duration,
            title: favouriteMeal[index].title,
            id: favouriteMeal[index].id,
            );
        },
        itemCount:favouriteMeal.length ,
      );
    }
  }
}
