import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/widgets/app_divider.dart';

import '../../../../utils/dimens.dart';
import '../../../../utils/gen/assets.gen.dart';
import '../../../../widgets/app_scaffold.dart';
import '../../../../widgets/user_profile_image_widget.dart';
import '../../colors/colors.dart';
import '../coffee_app_list_tile.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text('Profile'), automaticallyImplyLeading: false),
      body: FadeInDown(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.largePadding),
              UserProfileImageWidget(width: 110, height: 110),
              SizedBox(height: Dimens.largePadding),
              Text(
                'Ales Dev',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('ales.dev.studio@gmail.com'),
              SizedBox(height: Dimens.largePadding),
              CoffeeAppListTile(
                onTap: () {},
                title: 'My orders',
                leadingIconPath: Assets.icons.receipt,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Payment methods',
                leadingIconPath: Assets.icons.cardPos,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Addresses',
                leadingIconPath: Assets.icons.location,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Wallet',
                leadingIconPath: Assets.icons.wallet,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Notification',
                leadingIconPath: Assets.icons.notification,
                trailing: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: true,
                    onChanged: (final value) {},
                    activeTrackColor: CoffeeAppColors.secondaryColor,
                  ),
                ),
                padding: EdgeInsets.zero,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Feedback',
                leadingIconPath: Assets.icons.noteText,
              ),
              AppDivider(),
              CoffeeAppListTile(
                onTap: () {},
                title: 'Log out',
                leadingIconPath: Assets.icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
