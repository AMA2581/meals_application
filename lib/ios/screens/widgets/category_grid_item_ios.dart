import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_application/models/category.dart';

class CategoryGridItemIOS extends StatelessWidget {
  const CategoryGridItemIOS({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    // print(
    //     'Platform brightness is ${MediaQuery.of(context).platformBrightness}');
    return GestureDetector(
      onTap: () {},
      // splashColor: Theme.of(context).primaryColor,
      // borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
        ),
      ),
    );
  }
}
