import 'dart:convert';

import 'package:flutter/material.dart';

import './components/catImageAndText.dart';
import './components/food_card.dart';
import 'dataForCategories.dart';
import 'dataForFoods.dart';
import 'package:http/http.dart' as http;

//screens
import './detailsPage.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        DetailsPage.routeName: (context) => DetailsPage(),
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DataForCategories> _dataForCategories = []; //dataForCategories;
  List<DataForFoods> _dataForFoods = [];

  final int activeIndex = null;
  getDataForCategoreis() {
    var data = json.decode(testData);
    for (var cat in data) {
      DataForCategories _dataForCats = DataForCategories(
          id: cat["id"], imagePath: cat["imagePath"], name: cat["name"]);
      _dataForCategories.add(_dataForCats);
    }
    print(_dataForCategories);
    return _dataForCategories;
  }

  getDataForFoods() {
    var data = json.decode(dataForFoods);
    for (var food in data) {
      DataForFoods foods = DataForFoods(
          id: food['id'],
          imagePath: food['imagePath'],
          foodName: food['foodName'],
          otherText: food['otherText'],
          price: food['price']);
      _dataForFoods.add(foods);
    }
    return _dataForFoods;
  }

  @override
  void initState() {
    getDataForCategoreis();
    getDataForFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.search,
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text("Meals App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110.0,
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Benndip',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'what do you want to cook ?',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _dataForCategories == null
                    ? []
                    : _dataForCategories
                        .map((data) => CatImageAndText(
                              data.imagePath,
                              data.name,
                            ))
                        .toList()),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await new Future.delayed(const Duration(seconds: 2));
                setState(() {});
                return;
              },
              child: ListView(
                children: _dataForFoods == null
                    ? []
                    : _dataForFoods.map((data) => FoodCard(data.imagePath,
                        data.foodName, data.otherText, data.price)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
