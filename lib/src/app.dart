import 'package:flutter/material.dart';
import './utils/constants.dart';
import './screens/Home/HomeScreen.dart';
import './screens/Login/LoginScreen.dart';
import './screens/Signup/SignupScreen.dart';
import './screens/Settings/SettingsScreen.dart';
import './screens/History/HistoryScreen.dart';
import './screens/Rates/RatesScreen.dart';

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
