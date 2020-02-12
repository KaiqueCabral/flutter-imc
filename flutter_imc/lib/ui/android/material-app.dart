import 'package:flutter/material.dart';
import 'package:flutter_imc/ui/android/pages/home.page.dart';
import 'package:flutter_imc/blocs/en-US/imc.strings.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ImcStrings.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
