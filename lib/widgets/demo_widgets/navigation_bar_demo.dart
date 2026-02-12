import 'package:flutter/material.dart';

class NavigationBarDemo extends StatelessWidget {
  const NavigationBarDemo({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.deepPurpleAccent,
      selectedIndex: selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: Colors.white),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.category, color: Colors.white),
          icon: Icon(Icons.category_outlined),
          label: 'Categories',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.format_list_bulleted, color: Colors.white),
          icon: Icon(Icons.format_list_bulleted_outlined),
          label: 'Orders',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person, color: Colors.white),
          icon: Icon(Icons.person_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
