import 'package:flutter_masked_text/flutter_masked_text.dart';

class ImcBloc {
  var heightController = MaskedTextController(mask: '000');
  var weightController = MaskedTextController(mask: '000');
  var result = "";

  calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height * 1.0);

    if (imc < 18.6) {
      result = "Under the weight (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 18.6 && imc < 24.9) {
      result = "Ideal weight (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc < 29.9) {
      result = "A little bit over weight (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 29.9 && imc < 34.9) {
      result = "Obesity level I (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 34.9 && imc < 39.9) {
      result = "Obesity level II (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 40) {
      result = "Obesity level III (${imc.toStringAsPrecision(2)})";
    }
  }
}
