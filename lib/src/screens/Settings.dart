import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/drawer.dart';

class SettingsScreen extends StatelessWidget {
  final String title;

  SettingsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(title: title),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is $title page',
            ),
          ],
        ),
      ),
    );
  }
}
