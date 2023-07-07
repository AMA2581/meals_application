import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_application/models/meal.dart';

class MealsScreenIOS extends StatelessWidget {
  const MealsScreenIOS({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Text(
        meals[index].title,
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.xmark_octagon_fill,
                size: 50, color: CupertinoColors.inactiveGray),
            SizedBox(height: 10),
            Text(
              'Uh oh ...',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: CupertinoColors.inactiveGray,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: CupertinoColors.inactiveGray,
                  ),
            )
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: content,
    );
  }
}
