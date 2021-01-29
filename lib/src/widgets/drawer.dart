import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kColorPrimary,
              ),
              child: Text(
                'Some Title',
                style: TextStyle(
                  color: kColorWhite,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    kLinkHome, (Route<dynamic> route) => false);
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Rates'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, kLinkRates);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, kLinkHistory);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, kLinkSettings);
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, kLinkLogin);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Signup'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, kLinkSignup);
              },
            ),
          ],
        ),
      ),
    );
  }
}
