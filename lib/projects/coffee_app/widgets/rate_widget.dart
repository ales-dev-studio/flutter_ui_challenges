import 'package:flutter/material.dart';

import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../widgets/app_svg_viewer.dart';
import '../colors/colors.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
    this.textColor,
    this.iconColor,
  });

  final String rate;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CoffeeAppColors.secondaryColor,
        borderRadius: BorderRadius.circular(Dimens.corners),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.padding,
        vertical: Dimens.smallPadding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: Dimens.smallPadding,
        children: [
          AppSvgViewer(Assets.icons.starFilled, color: iconColor, width: 8),
          Text(rate, style: TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    );
  }
}
