//import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_imc/ui/android/material-app.dart';
import 'package:flutter_imc/ui/ios/cupertino-app.dart';

void main() {
  bool isWindows = true;
  if (isWindows) {
    runApp(MyMaterialApp());
  } else {
    runApp(MyCupertinoApp());
  }
}
