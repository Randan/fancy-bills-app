import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppCard extends StatelessWidget {
  AppCard({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(kGap),
        child: Column(
          children: [
            Text(title),
            Text(value.toString()),
          ],
        ),
      ),
    );
  }
}
