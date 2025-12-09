import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/projects/coffee_app/widgets/rate_widget.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';

import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../widgets/app_svg_viewer.dart';
import '../colors/colors.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: context.widthPx,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          aspectRatio: 1.0,
          viewportFraction: 0.65,
        ),
        items: getItems(),
      ),
    );
  }

  List<Widget> getItems() {
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
    List<Widget> items = [];
    for (final String title in titles) {
      items.add(
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 260,
              height: 250,
              margin: EdgeInsets.only(top: 70),
              padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
              decoration: BoxDecoration(
                color: CoffeeAppColors.primaryColor,
                borderRadius: BorderRadius.circular(Dimens.corners),
              ),
              child: Column(
                spacing: Dimens.largePadding,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 115),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'With creamy milk',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      Text(
                        'Volume 160 ml',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RateWidget(
                        rate: '3.5',
                        iconColor: Colors.white,
                        textColor: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: CoffeeAppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(2),
                        child: AppSvgViewer(
                          Assets.icons.arrowRight4,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              images[titles.indexOf(title)],
              width: 212,
              height: 187,
              fit: BoxFit.contain,
            ),
          ],
        ),
      );
    }

    return items;
  }
}
