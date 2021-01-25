import 'package:flutter/material.dart';
import './utils/constants.dart';
import './screens/home/home_screen.dart';
import './screens/login/login_screen.dart';
import './screens/signup/signup_screen.dart';
import './screens/settings/settings_screen.dart';
import './screens/history/history_screen.dart';
import './screens/rates/rates_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bills App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kColorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: kLinkHome,
      routes: {
        kLinkHome: (BuildContext context) => HomeScreen(title: 'Home'),
        kLinkLogin: (BuildContext context) => LoginScreen(title: 'Login'),
        kLinkSignup: (BuildContext context) => SignUpScreen(title: 'Signup'),
        kLinkSettings: (BuildContext context) =>
            SettingsScreen(title: 'Settings'),
        kLinkHistory: (BuildContext context) => HistoryScreen(title: 'History'),
        kLinkRates: (BuildContext context) => RatesScreen(title: 'Rates'),
      },
    );
  }
}
