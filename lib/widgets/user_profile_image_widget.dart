import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/gen/assets.gen.dart';

class UserProfileImageWidget extends StatelessWidget {
  const UserProfileImageWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      child: SizedBox(
        width: width ?? 50.0,
        height: height ?? 50.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            Assets.images.coffeeApp.profileImg.path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
