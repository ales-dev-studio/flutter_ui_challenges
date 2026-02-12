import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';

class FilledButtonDemo extends StatelessWidget {
  const FilledButtonDemo({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.icon,
    this.spaceBetween = true,
    this.verticalMargin = 8.0,
  });

  final String? title;
  final Color? color;
  final GestureTapCallback? onPressed;
  final IconData? icon;
  final bool spaceBetween;
  final double verticalMargin;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: context.sizePx.width - 16,
      height: 45.0,
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              color == null ? null : WidgetStateProperty.all<Color>(color!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment:
              spaceBetween
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
          children: [
            if (icon == null) const SizedBox.shrink() else Icon(icon, size: 20),
            Text(title ?? ''),
            if (icon == null)
              const SizedBox.shrink()
            else
              const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
