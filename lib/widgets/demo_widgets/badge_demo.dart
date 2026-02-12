import 'package:flutter/material.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key, this.count, required this.child});

  final int? count;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return count == null
        ? Badge(
          child: Container(
            margin: const EdgeInsets.only(top: 3.0),
            child: child,
          ),
        )
        : Badge.count(
          count: count!,
          child: Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: child,
          ),
        );
  }
}
