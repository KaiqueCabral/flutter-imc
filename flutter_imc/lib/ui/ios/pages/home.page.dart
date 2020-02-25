import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_imc/blocs/imc.bloc.dart';
import 'package:flutter_imc/blocs/en-US/imc.strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;
  ImcBloc bloc = new ImcBloc();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuint,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        actionsForegroundColor: Colors.blue,
        middle: Text(
          ImcStrings.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: ListView(
        children: <Widget>[
          _inputText(ImcStrings.height, bloc.heightController),
          _inputText(ImcStrings.weight, bloc.weightController),
          SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                bloc.result,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: bloc.colorResult,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: CupertinoButton.filled(
              child: Text(
                ImcStrings.calculate,
              ),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                  _animationController.reset();
                  _animationController.forward();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  _inputText(String labelText, TextEditingController _controller) => Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              labelText,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CupertinoTextField(
              placeholder: labelText,
              showCursor: true,
              controller: _controller,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      );
}
