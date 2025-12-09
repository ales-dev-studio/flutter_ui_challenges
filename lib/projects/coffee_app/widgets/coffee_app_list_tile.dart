import 'package:flutter/material.dart';

import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../widgets/app_svg_viewer.dart';


class CoffeeAppListTile extends StatelessWidget {
  const CoffeeAppListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingIconPath,
    this.trailing,
    this.padding,
  });

  final GestureTapCallback onTap;
  final String title;
  final String leadingIconPath;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: Dimens.smallPadding),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black.withValues(alpha: 0.6),
        ),
      ),
      leading: AppSvgViewer(leadingIconPath, width: 19),
      trailing:
          trailing ?? AppSvgViewer(Assets.icons.arrowRight4, width: 16),
    );
  }
}
