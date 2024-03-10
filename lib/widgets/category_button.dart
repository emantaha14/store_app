import 'package:flutter/material.dart';

import 'default_button.dart';

class CategoryButtons extends StatelessWidget {
  final Function() allCategoriesCallback;
  final Function() jeweleryCategoriesCallback;
  final Function() electronicsCategoriesCallback;
  final Function() menCategoriesCallback;
  final Function() womenCategoriesCallback;

  const CategoryButtons({
    super.key,
    required this.allCategoriesCallback,
    required this.jeweleryCategoriesCallback,
    required this.electronicsCategoriesCallback,
    required this.menCategoriesCallback,
    required this.womenCategoriesCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        height: 40,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            DefaultButton(text: 'All', onPressed: allCategoriesCallback),
            DefaultButton(
                text: 'Jewelery', onPressed: jeweleryCategoriesCallback),
            DefaultButton(
                text: 'Electronics', onPressed: electronicsCategoriesCallback),
            DefaultButton(
                text: 'Men\'s clothing', onPressed: menCategoriesCallback),
            DefaultButton(
                text: 'Women\'s clothing', onPressed: womenCategoriesCallback),
          ],
        ),
      ),
    );
  }
}
