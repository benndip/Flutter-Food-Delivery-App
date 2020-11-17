import 'package:flutter/material.dart';

import './components/catImageAndText.dart';
import './components/food_card.dart';
import 'dataForCategories.dart';
import 'dataForFoods.dart';

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
  final List<DataForCategories> _dataForCategories = dataForCategories;
  final List<DataForFoods> _dataForFoods = dataForFoods;
  final int activeIndex = null;

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
                children: _dataForCategories
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
                children: _dataForFoods
                    .map(
                      (data) => FoodCard(
                        data.imagePath,
                        data.foodName,
                        data.otherText,
                        data.price,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
