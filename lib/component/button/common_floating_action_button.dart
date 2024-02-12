import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  const CommonFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: onPressed,
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
