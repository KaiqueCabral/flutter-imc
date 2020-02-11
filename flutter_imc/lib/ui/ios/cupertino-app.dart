import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imc/ui/ios/pages/home.page.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Cálculo de IMC",
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
