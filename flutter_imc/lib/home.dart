import 'package:flutter/material.dart';
import 'package:flutter_imc/blocs/en-US/imc.strings.dart';
import 'package:flutter_imc/ui/android/material-app.dart';
import 'package:flutter_imc/ui/ios/cupertino-app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ImcStrings.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Choose the platform:",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _flatButtonIcon(
                  Icons.android,
                  Colors.green[600],
                  "Android",
                  Colors.lightGreen[100],
                  MyMaterialApp.routeName,
                  context,
                ),
                _flatButtonIcon(
                  Icons.android,
                  Colors.grey[600],
                  "iOS",
                  Colors.grey[300],
                  MyCupertinoApp.routeName,
                  context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _flatButtonIcon(IconData _icon, Color _color, String _labelText,
          Color _hoverColor, String routeName, BuildContext context) =>
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FlatButton.icon(
            icon: Icon(
              _icon,
              size: 100,
              color: _color,
            ),
            label: Text(_labelText),
            hoverColor: _hoverColor,
            padding: EdgeInsets.all(20),
            onPressed: () => Navigator.of(context).pushNamed(routeName),
          ),
        ),
      );
}
