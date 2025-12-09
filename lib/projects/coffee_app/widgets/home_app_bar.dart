import 'package:flutter/material.dart';
import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../colors/colors.dart';
import 'package:flutter_ui_challenges/widgets/app_bordered_icon_button.dart';
import 'package:flutter_ui_challenges/widgets/user_profile_image_widget.dart';

import 'app_search_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CoffeeAppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.corners),
          bottomRight: Radius.circular(Dimens.corners),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CoffeeAppColors.primaryColor,
            actions: [
              AppBorderedIconButton(
                iconPath: Assets.icons.shoppingCart,
                color: Colors.white,
                width: 46,
                height: 46,
              ),
              SizedBox(width: Dimens.largePadding),
              AppBorderedIconButton(
                iconPath: Assets.icons.notification,
                color: Colors.white,
                width: 46,
                height: 46,
              ),
            ],
            title: Row(
              spacing: Dimens.padding,
              children: [
                UserProfileImageWidget(),
                Column(
                  spacing: Dimens.padding,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Vanessa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'what would you like?',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            leadingWidth: 85,
            titleSpacing: Dimens.padding,
            actionsPadding: EdgeInsets.symmetric(
              horizontal: Dimens.largePadding,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 25,
              left: Dimens.largePadding,
              right: Dimens.largePadding,
            ),
            child: AppSearchBar(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 98);
}
