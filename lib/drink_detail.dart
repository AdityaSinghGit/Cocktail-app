import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal, Colors.black])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 3.0,
          title: Text(
            drink["strDrink"],
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          brightness: Brightness.dark,
          // shadowColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                  radius: 150,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "ID: ${drink["idDrink"]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
