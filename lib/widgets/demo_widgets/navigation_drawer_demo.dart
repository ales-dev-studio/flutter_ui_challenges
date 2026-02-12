import 'package:flutter/material.dart';

class NavigationDrawerDemo extends StatelessWidget {
  const NavigationDrawerDemo({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(final BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      children: [
        ...destinations.map((final AppNavigationDestination destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
      ],
    );
  }
}

const List<AppNavigationDestination> destinations = <AppNavigationDestination>[
  AppNavigationDestination(
    label: 'home',
    selectedIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
  ),
  AppNavigationDestination(
    label: 'Inbox',
    icon: Icon(Icons.inbox_outlined),
    selectedIcon: Icon(Icons.inbox),
  ),
  AppNavigationDestination(
    label: 'Outbox',
    icon: Icon(Icons.send_outlined),
    selectedIcon: Icon(Icons.send),
  ),
  AppNavigationDestination(
    label: 'Favorites',
    icon: Icon(Icons.favorite_outline),
    selectedIcon: Icon(Icons.favorite),
  ),
  AppNavigationDestination(
    label: 'Trash',
    icon: Icon(Icons.delete_outline),
    selectedIcon: Icon(Icons.delete),
  ),
];

class AppNavigationDestination {
  const AppNavigationDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}
