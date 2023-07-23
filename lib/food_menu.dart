import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'json_data.dart';
import 'menu_item.dart';

class FoodMenuApp extends StatefulWidget {
  const FoodMenuApp({super.key});

  @override
  FoodMenuAppState createState() => FoodMenuAppState();
}

class FoodMenuAppState extends State<FoodMenuApp> {
  late List<MenuItem> menuItems;

  @override
  void initState() {
    super.initState();
    menuItems = parseMenuItems(menuDataJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              // For desktop screens, display the menu in a grid layout
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1.0,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return buildMenuItemCard(context, menuItems[index]);
                },
              );
            } else {
              // For mobile screens, display the menu in a list layout
              return ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return buildMenuItemCard(context, menuItems[index]);
                },
              );
            }
          },
        );
      }),
    );
  }
}

Widget buildMenuItemCard(BuildContext context, MenuItem menuItem) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: Image.network(menuItem.image, fit: BoxFit.cover),
        ),
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
  );
}
