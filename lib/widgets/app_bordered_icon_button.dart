import 'package:flutter/material.dart';
import 'app_svg_viewer.dart';

class AppBorderedIconButton extends StatelessWidget {
  const AppBorderedIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.color,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: AppSvgViewer(iconPath, width: 25, color: color),
      ),
    );
  }
}
