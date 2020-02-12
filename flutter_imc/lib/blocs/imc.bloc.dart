import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ImcBloc {
  MaskedTextController heightController = MaskedTextController(mask: '000');
  MaskedTextController weightController = MaskedTextController(mask: '000');
  String result = "";
  Color colorResult = Colors.black;

  calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height * 1.0);

    if (imc < 18.6) {
      result = "Underweight (${imc.toStringAsPrecision(2)})";
      colorResult = Colors.red[300];
    } else if (imc >= 18.6 && imc < 24.9) {
      result = "Normal (${imc.toStringAsPrecision(2)})";
      colorResult = Colors.green[700];
    } else if (imc >= 24.9 && imc < 29.9) {
      result = "Overweight (${imc.toStringAsPrecision(2)})";
      colorResult = Colors.red[300];
    } else if (imc >= 29.9 && imc < 34.9) {
      result = "Obese (${imc.toStringAsPrecision(2)})";
      colorResult = Colors.red[700];
    } else if (imc >= 34.9) {
      result = "Extremely Obese (${imc.toStringAsPrecision(2)})";
      colorResult = Colors.red[900];
    }
  }
}
