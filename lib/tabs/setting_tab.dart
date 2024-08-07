import 'package:flutter/material.dart';

import '../app_color.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting",style: Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}
