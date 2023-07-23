import 'dart:convert';

class MenuItem {
  int id;
  String name;
  String description;
  List<String> ingredients;
  bool spicy;
  bool vegetarian;
  double price;
  String image;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.spicy,
    required this.vegetarian,
    required this.price,
    required this.image,
  });
}

List<MenuItem> parseMenuItems(String json) {
  final Map<String, dynamic> data = jsonDecode(json);
  List<MenuItem> menuItems = [];

  for (var category in data.keys) {
    for (var item in data[category]) {
      menuItems.add(MenuItem(
        id: item['id'],
        name: item['name'],
        description: item['description'],
        ingredients: List<String>.from(item['ingredients']),
        spicy: item['spicy'],
        vegetarian: item['vegetarian'],
        price: item['price'].toDouble(),
        image: item['image'],
      ));
    }
  }

  return menuItems;
}
