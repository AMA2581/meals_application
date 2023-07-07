import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_application/data/dummy_data.dart';
import 'package:meals_application/ios/screens/widgets/category_grid_item_ios.dart';

class CategoriesScreenIOS extends StatelessWidget {
  const CategoriesScreenIOS({super.key});

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
                CategoryGridItemIOS(category: category),
              const SizedBox(height: 10),
            ]),
          ),
        ],
      ),
    );
  }
}
