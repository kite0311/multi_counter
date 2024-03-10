import 'package:flutter/material.dart';

/// カウンターボタンの雛形
class CommonCounterButton extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final VoidCallback? onPressed;

  const CommonCounterButton({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.iconSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: iconColor,
      ),
      iconSize: iconSize,
      onPressed: onPressed,
    );
  }
}

/// アイテム追加ボタンの雛形
class CommonAddItemButton extends StatelessWidget {
  final Color iconColor;
  final IconData iconData;
  final VoidCallback onPressed;

  const CommonAddItemButton({
    super.key,
    required this.onPressed,
    required this.iconColor,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: iconColor,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
