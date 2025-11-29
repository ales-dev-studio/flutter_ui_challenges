import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/coffee_app/colors/colors.dart';
import 'package:flutter_ui_challenges/coffee_app/widgets/tabs/favorites_tab.dart';
import 'package:flutter_ui_challenges/coffee_app/widgets/tabs/home_tab.dart';
import 'package:flutter_ui_challenges/coffee_app/widgets/tabs/profile_tab.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../utils/gen/assets.gen.dart';
import '../../widgets/app_svg_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [HomeTab(), FavoritesTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      safeAreaTop: false,
      safeAreaBottom: false,
      body: _tabs[_currentIndex],
      padding: EdgeInsets.zero,
      bottomNavigationBar: SlideInUp(
        child: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          child: Container(
            margin: EdgeInsets.only(
              left: 28,
              right: 28,
              bottom: Dimens.largePadding,
              top: Dimens.padding,
            ),
            decoration: BoxDecoration(
              color: CoffeeAppColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.all(Dimens.padding),
            child: SalomonBottomBar(
              selectedColorOpacity: 1.0,
              currentIndex: _currentIndex,
              onTap:
                  (int index) => setState(() {
                    _currentIndex = index;
                  }),
              items: [
                bottomBarItem(
                  iconPath: Assets.icons.home2,
                  title: 'Home',
                  isSelected: _currentIndex == 0,
                ),
                bottomBarItem(
                  iconPath: Assets.icons.heart,
                  title: 'Favorites',
                  isSelected: _currentIndex == 1,
                ),
                bottomBarItem(
                  iconPath: Assets.icons.profileCircle,
                  title: 'Profile',
                  isSelected: _currentIndex == 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SalomonBottomBarItem bottomBarItem({
    required final String iconPath,
    required final String title,
    required final bool isSelected,
  }) => SalomonBottomBarItem(
    icon: Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).scaffoldBackgroundColor : null,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(4),
      child: Center(
        child: AppSvgViewer(
          iconPath,
          color: isSelected ? CoffeeAppColors.secondaryColor : Colors.white,
          width: 20,
        ),
      ),
    ),
    title: Text(title, style: TextStyle(color: Colors.white)),
    selectedColor: CoffeeAppColors.secondaryColor,
  );
}
