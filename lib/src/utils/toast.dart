import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './constants.dart';

void showToast(String message, type) {
  Color typeColor;

  switch (type) {
    case ToastType.ERROR:
      typeColor = kColorError;
      break;
    case ToastType.WARNING:
      typeColor = kColorWarning;
      break;
    case ToastType.SUCCESS:
      typeColor = kColorSuccess;
      break;
    case ToastType.INFO:
      typeColor = kColorInfo;
      break;
    default:
      typeColor = kColorDarkGrey;
      break;
  }

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: typeColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
