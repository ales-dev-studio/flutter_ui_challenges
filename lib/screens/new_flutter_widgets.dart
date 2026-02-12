import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/badge_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/carousel_view_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/drop_down_menu_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/filled_button_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/menu_anchor_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/navigation_bar_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/navigation_drawer_demo.dart';
import 'package:flutter_ui_challenges/widgets/demo_widgets/search_bar_demo.dart';

import '../widgets/demo_widgets/segmented_button_demo.dart';

class FlutterNewWidgets extends StatefulWidget {
  const FlutterNewWidgets({super.key});

  @override
  State<FlutterNewWidgets> createState() => _FlutterNewWidgetsState();
}

class _FlutterNewWidgetsState extends State<FlutterNewWidgets> {
  int selectedIndex = 0;
  int drawerSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerDemo(
        selectedIndex: drawerSelectedIndex,
        onDestinationSelected: (final int index){
          setState(() {
            drawerSelectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('New Flutter Widgets'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: BadgeDemo(count: 8, child: Icon(Icons.notifications)),
          ),
          MenuAnchorDemo(
            menuChildren: [
              MenuItemButton(
                leadingIcon: Icon(Icons.message),
                child: Text('New Chat'),
                onPressed: () {},
              ),
              MenuItemButton(
                leadingIcon: Icon(Icons.person_add),
                child: Text('New Contact'),
                onPressed: () {},
              ),
              SubmenuButton(
                menuChildren: [
                  MenuItemButton(onPressed: () {}, child: Text('Email')),
                  MenuItemButton(onPressed: () {}, child: Text('WhatsApp')),
                  MenuItemButton(onPressed: () {}, child: Text('Twitter')),
                  MenuItemButton(onPressed: () {}, child: Text('Telegram')),
                ],
                leadingIcon: Icon(Icons.share_rounded),
                child: Text('Share'),
              ),
              MenuItemButton(
                leadingIcon: Icon(Icons.settings),
                child: Text('Settings'),
                onPressed: () {},
              ),
            ],
          ),
        ],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: BadgeDemo(child: Icon(Icons.menu)),
        // ),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.0,
          children: [
            SearchBarDemo(),
            CarouselViewDemo(),
            Divider(),
            Column(
              spacing: 8.0,
              children: [Text('Single choice'), SingleChoice()],
            ),
            Column(
              spacing: 8.0,
              children: [Text('Multiple choice'), MultipleChoice()],
            ),
            Divider(),
            Column(
              children: [
                FilledButtonDemo(title: 'Filled Button', onPressed: () {}),
                FilledButtonDemo(
                  onPressed: () {},
                  title: 'Filled Button with icon',
                  icon: Icons.check,
                ),
              ],
            ),
            Divider(),
            Text('Selection Area'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SelectionArea(
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Divider(),
            DropDownMenuDemo(
              onSelected: (final int? value) {},
              items:
                  ['English', 'German', 'French', 'Spanish', 'Arabic']
                      .asMap()
                      .entries
                      .map(
                        (final MapEntry<int, String> item) =>
                            DropdownMenuEntry<int>(
                              value: item.key + 1,
                              label: item.value,
                            ),
                      )
                      .toList(),
              width: context.widthPx - 32.0,
              leadingIcon: Icons.language,
              child: Text('Select language'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarDemo(
        onDestinationSelected: (final int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
      ),
    );
  }
}
