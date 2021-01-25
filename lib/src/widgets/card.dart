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
        width: MediaQuery.of(context).size.width / 2 - kGap * 3,
        padding: EdgeInsets.all(kGap),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: kGap),
            Text(
              '${value.toString()}₴',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
