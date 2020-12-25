import 'package:flutter/material.dart';

import './detailArguments.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/detailsPage';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int numberOfPlates = 0;

  @override
  Widget build(BuildContext context) {
    final DetailArguments args = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Image.asset(
                    args.imagePath,
                  ),
                  Positioned(
                    top: 30,
                    child: Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.black54,
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_sharp),
                            color: Colors.black54,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    args.largeText,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                  Text(
                    '${args.price ?? "Empty"}',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text('by Pizza grey'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.horizontal_rule),
                    onPressed: () {
                      setState(() {
                        // ignore: unnecessary_statements
                        numberOfPlates == 0 ? null : numberOfPlates--;
                      });
                    },
                  ),
                  RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Colors.indigo,
                      child: Text('Add To Cart')),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        numberOfPlates++;
                        print('Hello $numberOfPlates');
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: width,
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DETAILS',
                    style: TextStyle(
                      letterSpacing: 3,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(width: 73, height: 2, color: Colors.indigo)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                args.smallText,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 70),
            Container(
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '$numberOfPlates plates of ${args.largeText}',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 30),
                    Text('amount: ${numberOfPlates * args.price}FCFA')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
