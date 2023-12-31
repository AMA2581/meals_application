import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_application/data/dummy_data.dart';
import 'package:meals_application/ios/screens/meals_ios.dart';
import 'package:meals_application/ios/screens/widgets/category_grid_item_ios.dart';
import 'package:meals_application/models/category.dart';

class CategoriesScreenIOS extends StatelessWidget {
  const CategoriesScreenIOS({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => MealsScreenIOS(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        // navigationBar: ,
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            // leading: Icon(CupertinoIcons.add),
            largeTitle: Text('Meals'),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            delegate: SliverChildListDelegate.fixed([
              for (final category in availableCategories)
                CategoryGridItemIOS(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  },
                ),
              const SizedBox(height: 10),
            ]),
          ),
        ],
      ),
    );
  }
}
