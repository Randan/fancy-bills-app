import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/date_format.dart';

class AppTable extends StatelessWidget {
  AppTable({Key key, this.list}) : super(key: key);
  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          border: TableBorder.all(
            color: kColorDarkGrey,
          ),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(kGap),
                    alignment: Alignment.center,
                    child: Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(kGap),
                    alignment: Alignment.center,
                    child: Text(
                      'Value',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...list
                .map(
                  (row) => TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(kGap),
                          alignment: Alignment.center,
                          child: Text('${dateFromIso(row['date'])}'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.all(kGap),
                          alignment: Alignment.center,
                          child: Text('${row['value']}'),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
