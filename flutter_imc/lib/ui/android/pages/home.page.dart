import 'package:flutter/material.dart';
import 'package:flutter_imc/blocs/imc.bloc.dart';
import 'package:flutter_imc/blocs/en-US/imc.strings.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(ImcStrings.title),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
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
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  ImcStrings.calculate,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      bloc.calculate();
                      _animationController.reset();
                      _animationController.forward();
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _inputText(String labelText, MaskedTextController _controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          //autovalidate: true,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.all(0),
          ),
          controller: _controller,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter some text.";
            } else if (double.tryParse(value) == 0) {
              return "Please use only numerics.";
            }
            return null;
          },
        ),
      );
}
