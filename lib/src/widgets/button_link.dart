import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ButtonLink extends StatelessWidget {
  ButtonLink({
    Key key,
    @required this.title,
    @required this.screenName,
  }) : super(key: key);
  final String title;
  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.transparent,
        textColor: kColorPrimary,
        padding: EdgeInsets.all(0.0),
        splashColor: Colors.transparent,
        onPressed: () {
          if (screenName == 'back')
            Navigator.of(context).pop();
          else
            Navigator.pushNamed(context, screenName);
        },
        child: Text(title),
      ),
    );
  }
}
