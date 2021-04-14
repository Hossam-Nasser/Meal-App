import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text,IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(icon,size: 26),
      title: Text(text, style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold
      ),
      ),
      onTap:tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme
                .of(context)
                .accentColor,
            child: Text("Cooking up!", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme
                  .of(context)
                  .primaryColor,
            )
            ),
          ),
          SizedBox(height: 20,),
          buildListTile("Meal",Icons.restaurant,(){
            return Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filters",Icons.settings,(){
            return Navigator.of(context).pushReplacementNamed(Filters.routName);
          })
        ],
      ),
    );
  }
}
