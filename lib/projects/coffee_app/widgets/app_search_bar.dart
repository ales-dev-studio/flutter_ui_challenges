import 'package:flutter/material.dart';
import '../../../utils/dimens.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../widgets/app_svg_viewer.dart';
import '../colors/colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: CoffeeAppColors.secondaryColor,
        borderRadius: BorderRadius.circular(Dimens.corners),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: Dimens.smallPadding),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search for coffee',
            hintStyle: TextStyle(color: Colors.white, fontSize: 13),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: Dimens.mediumPadding,
                right: Dimens.mediumPadding,
                bottom: Dimens.smallPadding,
              ),
              child: AppSvgViewer(
                Assets.icons.searchNormal1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
