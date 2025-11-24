import 'package:flutter/material.dart';
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
      ),
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
          children: [
            BorderedContainer(
              child: InkWell(
                borderRadius: BorderRadius.circular(Dimens.corners),
                onTap: () {},
                child: ListTile(
                  title: Text('Coffee App UI'),
                  leading: Icon(Icons.coffee_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
