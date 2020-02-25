import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imc/blocs/en-US/imc.strings.dart';
import 'package:flutter_imc/ui/ios/pages/home.page.dart';

class MyCupertinoApp extends StatelessWidget {
  static const String routeName = "/ios";

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: ImcStrings.title,
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
