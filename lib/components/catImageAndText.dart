import 'package:flutter/material.dart';

class CatImageAndText extends StatelessWidget {
  final String imagePath, name;
  // final Function onCategoryChoose;

  CatImageAndText(
    this.imagePath,
    this.name,
    // this.onCategoryChoose
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            color: Colors.grey,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(
          left: 5,
          right: 20,
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.asset(imagePath),
              SizedBox(
                width: 5,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
