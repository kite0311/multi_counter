import 'package:flutter/material.dart';

class InitializationButton extends StatelessWidget {
  const InitializationButton(
      {super.key, required this.onPressed, required this.ButtonText});

  final Function(BuildContext) onPressed;
  final String ButtonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(context),
      child: Text(ButtonText),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
