import 'package:counter/presentation/theme/colors.dart';
import 'package:counter/presentation/theme/size.dart';
import 'package:flutter/material.dart';

class CmnIncrButton extends StatelessWidget {
  const CmnIncrButton({
    super.key,
    required this.onIncrement,
  });
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add_circle_outline,
        color: CmnColor.darkgrey,
      ),
      iconSize: CmnSize.i26,
      onPressed: onIncrement,
    );
  }
}
