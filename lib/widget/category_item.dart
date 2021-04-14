import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;


  CategoryItem(this.title, this.id, this.color);

  void selectCategory(BuildContext cts){
    Navigator.of(cts).pushNamed(CategoryMealScreen.routeName,
    arguments: {
      'id':id,
      'title':title,
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(title,style: Theme.of(context).textTheme.title,) ,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              color.withOpacity(0.7),
              color,
            ] ,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
