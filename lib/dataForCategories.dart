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

final dataForCategories = [
  new DataForCategories(
    id: 1,
    imagePath: 'assets/icons/fruit.png',
    name: 'fruit',
  ),
  new DataForCategories(
    id: 2,
    imagePath: 'assets/icons/hamburger.png',
    name: 'hamburger',
  ),
  new DataForCategories(
    id: 3,
    imagePath: 'assets/icons/ice-cream.png',
    name: 'ice-cream',
  ),
  new DataForCategories(
    id: 4,
    imagePath: 'assets/icons/rice.png',
    name: 'rice',
  ),
  new DataForCategories(
    id: 5,
    imagePath: 'assets/icons/rice.png',
    name: 'rice',
  )
];
