import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_challenges/utils/app_navigator.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';
import 'package:flutter_ui_challenges/utils/sized_context.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';

import '../../../utils/gen/assets.gen.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void setFullscreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void exitFullscreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void initState() {
    super.initState();
     setFullscreen();
  }

  @override
  void dispose() {
    super.dispose();
    exitFullscreen();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      safeAreaBottom: false,
      safeAreaTop: false,
      body: Stack(
        children: [
          SizedBox(
            width: context.widthPx,
            height: context.heightPx,
            child: Assets.images.coffeeApp.coffeeBg.image(
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: context.widthPx,
            height: context.heightPx,
            color: Color(0xFF392725).withValues(alpha: 0.5),
          ),
          FadeInDown(
            child: Center(
              child: Column(
                spacing: Dimens.largePadding,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Special',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'COFFEE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FadeInUp(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Dimens.largePadding),
                child: ElevatedButton(
                  onPressed: () {
                    exitFullscreen();
                    appPush(context, HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(214, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  child: Text(
                    'Get in Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
