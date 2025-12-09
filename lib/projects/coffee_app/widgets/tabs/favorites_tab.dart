import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';

import '../../../../utils/dimens.dart';
import '../../../../utils/gen/assets.gen.dart';
import '../../../../widgets/app_icon_buttons.dart';
import '../../../../widgets/shaded_container.dart';
import '../../colors/colors.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> productsNames = [
      'Mocha Coffee',
      'Cappuccino',
      'Chocolate milkshake',
      'Mocha Latte',
      'Hot chocolate',
      'Caramel Mocha coffee',
      'Mocha Coffee',
      'Cappuccino',
      'Chocolate milkshake',
      'Caramel Mocha coffee',
      'Hot chocolate',
      'Mocha Latte',
    ];
    final List<String> productsImage = [
      Assets.images.coffeeApp.product1.path,
      Assets.images.coffeeApp.product2.path,
      Assets.images.coffeeApp.product3.path,
      Assets.images.coffeeApp.product4.path,
      Assets.images.coffeeApp.product5.path,
      Assets.images.coffeeApp.product6.path,
      Assets.images.coffeeApp.product1.path,
      Assets.images.coffeeApp.product2.path,
      Assets.images.coffeeApp.product3.path,
      Assets.images.coffeeApp.product4.path,
      Assets.images.coffeeApp.product5.path,
      Assets.images.coffeeApp.product6.path,
    ];

    return AppScaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        automaticallyImplyLeading: false,
      ),
      body: FadeInDown(
        child: Padding(
          padding: const EdgeInsets.only(top: Dimens.largePadding),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Dimens.largePadding,
              mainAxisExtent: 228,
            ),
            itemCount: productsNames.length,
            itemBuilder: (final context, final index) {
              return ShadedContainer(
                margin: EdgeInsets.only(bottom: Dimens.largePadding),
                child: Column(
                  spacing: Dimens.padding,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimens.padding),
                      child: SizedBox(
                        height: 114,
                        width: context.widthPx,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimens.corners),
                          child: Image.asset(
                            productsImage[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.padding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: Dimens.largePadding,
                        children: [
                          Text(
                            productsNames[index],
                            style: TextStyle(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${index + 1}8.00',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: AppIconButton(
                                  iconPath: Assets.icons.shoppingCart,
                                  backgroundColor:
                                      CoffeeAppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
