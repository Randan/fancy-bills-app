import 'package:flutter/material.dart';

// Colors
final Color kColorPrimary = Colors.indigo;
final Color kColorWhite = Colors.white;
final Color kColorDarkGrey = Colors.grey;

const Color kColorInfo = Color(0xff0099CC);
const Color kColorError = Color(0xffCC0000);
const Color kColorWarning = Color(0xffFF8800);
const Color kColorSuccess = Color(0xff007E33);

// Links
final String kLinkHome = '/';
final String kLinkLogin = '/login';
final String kLinkSignup = '/signup';
final String kLinkSettings = '/settings';
final String kLinkHistory = '/history';
final String kLinkRates = '/rates';

// Sizes
final double kGap = 8.0;

// Enums
enum ToastType { INFO, SUCCESS, WARNING, ERROR }
enum RateType {
  ElecAbove100,
  ElecBelow100,
  ColdWater,
  HotWater,
  Sewerage,
  Rent
}
