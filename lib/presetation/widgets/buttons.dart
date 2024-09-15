import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.firstTextButton, required this.secTextButton,required this.firstButtonOnPressed, required this.secButtonOnPressed});

  final String firstTextButton;
  final String secTextButton;
 final void Function()? firstButtonOnPressed;
 final void Function()? secButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: firstButtonOnPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              padding: const EdgeInsets.symmetric(vertical: 26.0),
            ),
            child: Text(
              firstTextButton,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: secButtonOnPressed ,
            style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Colors.white, width: 2),
              padding: const EdgeInsets.symmetric(vertical: 25.0),
            ),
            child: Text(
              secTextButton,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
