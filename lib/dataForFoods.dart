import 'dart:convert';

class DataForFoods {
  final String imagePath;
  final String foodName;
  final String otherText;
  final int price;
  final int id;

  const DataForFoods({
    this.id,
    this.imagePath,
    this.foodName,
    this.otherText,
    this.price,
  });
}

final dynamic dataForFoods = json.encode([
  {
    'id': 1,
    'imagePath': 'assets/images/bacon.jpg',
    'foodName': 'Bacon',
    'otherText':
        'Some good bacon to try, this is still some goo food to try ou later in the day  or maybe after work. So this is what we are trying to say uptill now so please what do you think??',
    'price': 1000,
  },
  {
    'id': 2,
    'imagePath': 'assets/images/bread.jpg',
    'foodName': 'Bread',
    'otherText':
        'Some good bacon to try, this is still some goo food to try ou later in the day  or maybe after work. So this is what we are trying to say uptill now so please what do you think??',
    'price': 2500,
  },
  {
    'id': 3,
    'imagePath': 'assets/images/cake.jpg',
    'foodName': 'Cake',
    'otherText':
        'Some good cake to try, this is still some goo food to try ou later in the day  or maybe after work. So this is what we are trying to say uptill now so please what do you think??',
    'price': 5000,
  },
  {
    'id': 4,
    'imagePath': 'assets/images/meat.jpg',
    'foodName': 'Meat',
    'otherText':
        'Some good meat to try, this is still some goo food to try ou later in the day  or maybe after work. So this is what we are trying to say uptill now so please what do you think??',
    'price': 7567,
  }
]);
