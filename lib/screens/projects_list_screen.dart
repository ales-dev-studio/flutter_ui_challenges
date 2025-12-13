import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/screens/sliver_app_bar_demo.dart';

import '../projects/coffee_app/screens/splash_screen.dart';
import '../utils/app_navigator.dart';
import '../utils/dimens.dart';
import '../widgets/bordered_container.dart';


class ProjectsListScreen extends StatelessWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter UI Challenges and Mini Projects')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.largePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.largePadding,
          children: [
            Text(
              'Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _ListTile(
              title: 'Coffee App',
              onTap: () {
                appPush(context, SplashScreen());
              },
              icon: Icons.coffee_outlined,
            ),

            Text(
              'Screens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _ListTile(
              title: 'Sliver Appbar demo',
              onTap: () {
                appPush(context, SliverAppBarDemo());
              },
              icon: Icons.style_outlined,
            ),
            _ListTile(
              title: 'Wallet screen with Slivers',
              onTap: () {
                appPush(context, SplashScreen());
              },
              icon: Icons.wallet,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({required this.title, this.onTap, this.icon});

  final String title;
  final GestureTapCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimens.corners),
        onTap: onTap,
        child: ListTile(title: Text(title), leading: Icon(icon)),
      ),
    );
  }
}
