import 'package:flutter/material.dart';

import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../colors/colors.dart';

class CoffeeTypesList extends StatelessWidget {
  const CoffeeTypesList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Espresso coffee',
      'Latte coffee',
      'Cup coffee',
      'cappuccino',
      'Espresso coffee',
      'Latte coffee',
      'Cup coffee',
      'cappuccino',
    ];
    final List<String> images = [
      Assets.images.coffeeApp.coffee1.path,
      Assets.images.coffeeApp.coffee2.path,
      Assets.images.coffeeApp.coffee3.path,
      Assets.images.coffeeApp.coffee4.path,
      Assets.images.coffeeApp.coffee1.path,
      Assets.images.coffeeApp.coffee2.path,
      Assets.images.coffeeApp.coffee3.path,
      Assets.images.coffeeApp.coffee4.path,
    ];
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: titles.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (final context, final index) {
          return Column(
            spacing: Dimens.padding,
            children: [
              Container(
                width: 107,
                height: 107,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  color: CoffeeAppColors.primaryColor,
                ),
                padding: EdgeInsets.all(Dimens.largePadding),
                margin: EdgeInsets.symmetric(
                  horizontal: index == 0 ? Dimens.largePadding : Dimens.padding,
                ),
                child: Center(child: Image.asset(images[index])),
              ),
              Text(
                titles[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        },
      ),
    );
  }
}
