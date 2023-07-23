import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'food_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return const FoodMenuApp();
        },
      ),
    );
  }
}
