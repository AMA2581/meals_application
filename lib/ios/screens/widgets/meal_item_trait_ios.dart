import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItemTraitIOS extends StatelessWidget {
  const MealItemTraitIOS({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: CupertinoColors.systemGrey,
        ),
        SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(color: CupertinoColors.systemGrey),
        )
      ],
    );
  }
}
