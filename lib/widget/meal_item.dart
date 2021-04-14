import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final String title;
  final int duration;


  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.title,
    @required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'UnKnow';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'UnKnow';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailsScreen.routeName, arguments: id)
        .then((result) {
      //if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(title,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(
                        "$duration min",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(width: 6),
                      Text(complexityText.toString(),
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(width: 6),
                      Text(affordabilityText.toString(),
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
