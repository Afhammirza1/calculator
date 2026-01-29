import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic logic = CalculatorLogic();

  Widget buildRow(List<String> buttons, {Color? color}) {
    return Row(
      children: buttons.map((btn) {
        return CalcButton(
          text: btn,
          color: color ?? Colors.grey,
          onTap: () {
            setState(() {
              if (btn == "C") {
                logic.clear();
              } else if (btn == "⌫") {
                logic.backspace();
              } else if (btn == "=") {
                logic.evaluate();
              } else {
                logic.add(btn);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      logic.expression,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      logic.result,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            buildRow(["sin(", "cos(", "tan(", "√("], color: Colors.blueGrey),
            buildRow(["7", "8", "9", "/"]),
            buildRow(["4", "5", "6", "*"]),
            buildRow(["1", "2", "3", "-"]),
            buildRow(["0", ".", "=", "+"]),
            buildRow(["(", ")", "⌫", "C"], color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
