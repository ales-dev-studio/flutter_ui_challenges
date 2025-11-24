import 'package:flutter/material.dart';

import 'app_svg_viewer.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: AppSvgViewer(
          iconPath,
          width: 25,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }
}
