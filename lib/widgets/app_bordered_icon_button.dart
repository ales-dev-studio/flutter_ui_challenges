import 'package:flutter/material.dart';
import 'app_svg_viewer.dart';

class AppBorderedIconButton extends StatelessWidget {
  const AppBorderedIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
    this.color,
    this.width,
    this.height,
  });

  final String iconPath;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 56,
      height: height ?? 56,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed ?? () {},
        icon: AppSvgViewer(iconPath, width: 20, color: color),
      ),
    );
  }
}