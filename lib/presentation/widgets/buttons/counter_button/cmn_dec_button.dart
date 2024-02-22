import 'package:counter/presentation/theme/colors.dart';
import 'package:counter/presentation/theme/size.dart';
import 'package:flutter/material.dart';

class CmnDecButton extends StatelessWidget {
  const CmnDecButton({
    super.key,
    required this.onDecrement,
  });

  final VoidCallback onDecrement;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.remove_circle_outline,
        color: CmnColor.darkgrey,
      ),
      iconSize: CmnSize.i26,
      onPressed: onDecrement,
    );
  }
}
