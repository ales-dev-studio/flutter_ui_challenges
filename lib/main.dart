import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/projects/coffee_app/screens/splash_screen.dart';
import 'package:flutter_ui_challenges/utils/app_navigator.dart';
import 'package:flutter_ui_challenges/utils/dimens.dart';
import 'package:flutter_ui_challenges/widgets/bordered_container.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProjectsListScreen(),
    );
  }
}

class ProjectsListScreen extends StatelessWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter UI Challenges and Mini Projects')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.largePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.largePadding,
          children: [
            Text(
              'Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _ListTile(
              title: 'Coffee App',
              onTap: () {
                appPush(context, SplashScreen());
              },
              icon: Icons.coffee_outlined,
            ),

            Text(
              'Screens',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _ListTile(
              title: 'Wallet screen with Slivers',
              onTap: () {
                appPush(context, SplashScreen());
              },
              icon: Icons.wallet,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({required this.title, this.onTap, this.icon});

  final String title;
  final GestureTapCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimens.corners),
        onTap: onTap,
        child: ListTile(title: Text(title), leading: Icon(icon)),
      ),
    );
  }
}
