import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const CalcButton({
    required this.text,
    required this.onTap,
    this.color = Colors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
