import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_imc/home.dart';
import 'package:flutter_imc/ui/android/material-app.dart';
import 'package:flutter_imc/ui/ios/cupertino-app.dart';

void main() {
  try {
    if (Platform.isAndroid) {
      runApp(MyMaterialApp());
    } else if (Platform.isIOS) {
      runApp(MyCupertinoApp());
    } else {
      runApp(ChoosePlatform());
    }
  } catch (err) {
    runApp(ChoosePlatform());
    print(err);
  }
}

class ChoosePlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculation",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        MyMaterialApp.routeName: (BuildContext context) => MyMaterialApp(),
        MyCupertinoApp.routeName: (BuildContext context) => MyCupertinoApp(),
      },
    );
  }
}
