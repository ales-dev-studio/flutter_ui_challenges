import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/widgets/app_scaffold.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Profile Tab'),
      ),
    );
  }
}
