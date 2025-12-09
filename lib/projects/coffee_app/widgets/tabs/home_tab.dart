import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';

import '../categories_widget.dart';
import '../coffee_types_list.dart';
import '../home_app_bar.dart';
import '../products_list.dart';
import '../title_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: AppScaffold(
        appBar: HomeAppBar(),
        safeAreaTop: false,
        padding: EdgeInsets.zero,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimens.largePadding),
              CategoriesWidget(),
              SizedBox(height: Dimens.largePadding),
              CoffeeTypesList(),
              SizedBox(height: Dimens.veryLargePadding),
              TitleWidget(
                title: 'Popular products',
                onViewAllButtonPressed: () {},
              ),
              ProductsList(),
              SizedBox(height: Dimens.largePadding),
              TitleWidget(
                title: 'Top products',
                onViewAllButtonPressed: () {},
              ),
              ProductsList(),
              SizedBox(height: Dimens.largePadding),
            ],
          ),
        ),
      ),
    );
  }
}
