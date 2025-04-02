enum Gender {
  male('Male'),
  female('Female'),
  unisex('Unisex');

  final String name;

  const Gender(this.name);
}

enum Category {
  accessories('Accessories'),
  bags('Bags'),
  jewelry('Jewelry'),
  shoes('Shoes'),
  tableware('Tableware'),
  textilesLinens('Textiles & Linens'),
  homeDecor('Home Décor'),
  clothing('Clothing');

  final String name;

  const Category(this.name);
}
