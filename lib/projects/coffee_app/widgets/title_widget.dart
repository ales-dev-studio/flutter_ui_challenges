import 'package:flutter/material.dart';

import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../widgets/app_text_button.dart';
import '../colors/colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.thumbnailPath,
    this.onViewAllButtonPressed,
  });

  final String title;
  final String? thumbnailPath;
  final GestureTapCallback? onViewAllButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: Dimens.largePadding,
            children: [
              if (thumbnailPath != null)
                Image.asset(thumbnailPath!, width: 34, height: 34),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          if (onViewAllButtonPressed != null)
            AppTextButton(
              onPressed: onViewAllButtonPressed,
              title: 'View all',
              iconPath: Assets.icons.arrowRight1,
              color: CoffeeAppColors.secondaryColor,
            ),
        ],
      ),
    );
  }
}
