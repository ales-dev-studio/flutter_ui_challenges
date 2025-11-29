import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';

import '../colors/colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Hot Coffee',
      'Cold Coffee',
      'Jacobs Coffee',
      'Starbucks Coffee',
      'Hot Coffee',
      'Cold Coffee',
      'Jacobs Coffee',
      'Starbucks Coffee',
    ];
    return SizedBox(
      height: 34,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (final context, final index) {
          return Padding(
            padding: EdgeInsets.only(left: Dimens.largePadding),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(Dimens.corners),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      index == 0
                          ? CoffeeAppColors.secondaryColor
                          : Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  border: Border.all(color: CoffeeAppColors.secondaryColor),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.largePadding,
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          index == 0
                              ? Colors.white
                              : CoffeeAppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
