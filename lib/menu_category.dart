import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuCategoryScreen extends StatelessWidget {
  final MenuItem menuItem;

  const MenuCategoryScreen(this.menuItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.name),
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Image.network(menuItem.image),
                ListTile(
                  title: Text(menuItem.name),
                  subtitle: Text(menuItem.description),
                ),
                ListTile(
                  title: const Text('Ingredients'),
                  subtitle: Text(menuItem.ingredients.join(', ')),
                ),
                ListTile(
                  title: const Text('Spicy'),
                  subtitle: Text(menuItem.spicy ? 'Yes' : 'No'),
                ),
                ListTile(
                  title: const Text('Vegetarian'),
                  subtitle: Text(menuItem.vegetarian ? 'Yes' : 'No'),
                ),
                ListTile(
                  title: const Text('Price'),
                  subtitle: Text('\$${menuItem.price.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
