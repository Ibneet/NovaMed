import 'package:flutter/material.dart';

class MyMoods extends StatefulWidget {
  @override
  _MyMoodsState createState() => _MyMoodsState();
}

class _MyMoodsState extends State<MyMoods> {
  List<bool> isSelected = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedBorderColor: Theme.of(context).primaryColor,
        renderBorder: false,
        fillColor: Colors.transparent ,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.sentiment_very_dissatisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.sentiment_dissatisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.sentiment_neutral, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.sentiment_satisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.sentiment_very_satisfied, size: 36,),
          ),
        ],

        isSelected: isSelected,
        onPressed: (int index){
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}