import 'package:flutter/material.dart';

class InitializationButton extends StatelessWidget {
  const InitializationButton(
      {super.key, required this.onPressed, required this.buttonText});

  final Function(BuildContext) onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(context),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
      child: Text(buttonText),
    );
  }
}
