import 'package:flutter/material.dart';

class MenuAnchorDemo extends StatelessWidget {
  const MenuAnchorDemo({super.key, required this.menuChildren});

  final List<Widget> menuChildren;

  @override
  Widget build(final BuildContext context) {
    return MenuAnchor(
      builder: (
        final BuildContext context,
        final MenuController controller,
        final Widget? child,
      ) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert),
        );
      },
      menuChildren: menuChildren,
      style: MenuStyle(
        alignment: Alignment.topCenter,
        elevation: WidgetStateProperty.resolveWith(
          (final Set<WidgetState> states) => 3,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
