import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_application/ios/screens/meals_details_ios.dart';
import 'package:meals_application/ios/screens/widgets/meal_item_trait_ios.dart';
import 'package:meals_application/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemIOS extends StatelessWidget {
  const MealItemIOS({
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (ctx) => MealsDetailsScreenIOS(
                meal: meal,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 130,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 130,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            CupertinoColors.black,
                            Color.fromRGBO(0, 0, 0, 0.774),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white,
                            ),
                          ),
                          // const SizedBox(height: 3),
                          const Spacer(),
                          Column(
                            children: [
                              MealItemTraitIOS(
                                icon: CupertinoIcons.alarm_fill,
                                label: '${meal.duration} min',
                              ),
                              const SizedBox(height: 3),
                              MealItemTraitIOS(
                                icon: CupertinoIcons.briefcase_fill,
                                label: complexityText,
                              ),
                              const SizedBox(height: 3),
                              MealItemTraitIOS(
                                icon: CupertinoIcons.money_dollar_circle_fill,
                                label: affordabilityText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Color.fromRGBO(0, 0, 0, 0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
