import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import './src/app.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(App());
}
