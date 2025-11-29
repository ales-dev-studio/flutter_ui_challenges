import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Favorites Tab'),
      ),
    );
  }
}
