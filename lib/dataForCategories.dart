import 'dart:convert';

class DataForCategories {
  final int id;
  final String imagePath;
  final String name;

  const DataForCategories({
    this.id,
    this.imagePath,
    this.name,
  });
}

 final dynamic testData = json.encode([
      {
        "id": 1,
        "imagePath": 'assets/icons/fruit.png',
        "name": 'fruit',
      },
      {
        "id": 2,
        "imagePath": 'assets/icons/hamburger.png',
        "name": 'hamburger',
      },
      {
        'id': 3,
        'imagePath': 'assets/icons/ice-cream.png',
        'name': 'ice-cream',
      }
    ]);
