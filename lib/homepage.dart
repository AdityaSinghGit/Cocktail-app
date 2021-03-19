import 'dart:convert';
import 'dart:ui';
import 'package:cocktail_app/drink_detail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    // print(res.body);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.teal])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 3.0,
          title: Center(
              child: Text(
            "Cocktail App",
            style: TextStyle(color: Colors.white, fontSize: 28),
          )),
          brightness: Brightness.dark,
          // shadowColor: Colors.red,
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                          radius: 23,
                        ),
                      ),
                      title: Text(
                        "${drink["strDrink"]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrinkDetail(drink: drink)));
                      },
                    );
                  },
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ),
      ),
    );
  }
}
