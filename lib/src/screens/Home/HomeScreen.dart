import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import '../../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('button pressed');
        },
        tooltip: 'Some Button',
        child: Icon(Icons.add),
      ),
    );
  }
}
