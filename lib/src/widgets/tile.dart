import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppTile extends StatelessWidget {
  AppTile({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(kGap * 2),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '${value.toString()}₴',
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
