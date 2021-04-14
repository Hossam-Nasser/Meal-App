import 'package:flutter/material.dart';
import '../widget/drawer_item.dart';

class Filters extends StatefulWidget {
  static const String routName = "Filters";

  final Function saveFilters;
  final Map<String,bool> currentFilters;


  Filters( this.currentFilters,this.saveFilters,);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState(){
      _glutenFree = widget.currentFilters['gluten'];
      _lactoseFree = widget.currentFilters['lactose'];
      _vegan = widget.currentFilters['vegan'];
      _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }


  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
          actions: [
            IconButton(icon: Icon(Icons.save),
                onPressed:(){
                  final Map<String, bool> selectfilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };

                  widget.saveFilters(selectfilters);
                })
          ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "Gluten free", "only include gluten-free meals.", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  "Lactose Fre", "only include Lactose-free meals.", _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              buildSwitchListTile(
                  "Vegetarian", "only include vegetarian meals.", _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              buildSwitchListTile(
                  "Vegan", "only include vegan meals.", _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
