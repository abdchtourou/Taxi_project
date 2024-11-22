import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  GradientCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          gradient: value
              ? const LinearGradient(
            begin: Alignment(-0.9, -1),
            end: Alignment(0.9, 1),
            colors: [
              Color(0xFF0E151B),
              Color(0xFF436481),
            ],
          )
              : null,
          color: value ? null : Colors.transparent,
          border: Border.all(
            color: Colors.white60,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? const Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}
