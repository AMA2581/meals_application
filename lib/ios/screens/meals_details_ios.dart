import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_application/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsScreenIOS extends StatelessWidget {
  const MealsDetailsScreenIOS({
    super.key,
    required this.meal,
  });

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(meal.title),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.hardEdge,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? CupertinoColors.lightBackgroundGray
                    : CupertinoColors.darkBackgroundGray,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.alarm_fill,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? CupertinoColors.secondaryLabel
                              : CupertinoColors.systemGrey,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${meal.duration} minutes',
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? CupertinoColors.secondaryLabel
                                : CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.briefcase_fill,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? CupertinoColors.secondaryLabel
                              : CupertinoColors.systemGrey,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          complexityText,
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? CupertinoColors.secondaryLabel
                                : CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.money_dollar_circle_fill,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? CupertinoColors.secondaryLabel
                              : CupertinoColors.systemGrey,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          affordabilityText,
                          style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? CupertinoColors.secondaryLabel
                                : CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: const Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? CupertinoColors.lightBackgroundGray
                    : CupertinoColors.darkBackgroundGray,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final ingredient in meal.ingredients) Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(ingredient),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: const Text(
                'Steps',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? CupertinoColors.lightBackgroundGray
                    : CupertinoColors.darkBackgroundGray,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final step in meal.steps) Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(step),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
