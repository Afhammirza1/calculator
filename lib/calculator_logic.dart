import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String expression = "";
  String result = "";

  void add(String value) {
    expression += value;
  }

  void clear() {
    expression = "";
    result = "";
  }

  void backspace() {
    if (expression.isNotEmpty) {
      expression = expression.substring(0, expression.length - 1);
    }
  }

  void evaluate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } catch (e) {
      result = "Error";
    }
  }
}
