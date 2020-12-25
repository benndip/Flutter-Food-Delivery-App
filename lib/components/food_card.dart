import 'package:Flutter/detailArguments.dart';
import 'package:flutter/material.dart';

import '../detailsPage.dart';

class FoodCard extends StatelessWidget {
  final String imagePath, largeText, smallText;
  final int price;

  FoodCard(this.imagePath, this.largeText, this.smallText, this.price);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsPage.routeName,
          arguments: DetailArguments(imagePath, largeText, smallText, price)
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 17),
        color: Colors.amber[80],
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              imagePath,
              width: double.infinity,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                largeText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text(
                smallText,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' \$ $price',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
