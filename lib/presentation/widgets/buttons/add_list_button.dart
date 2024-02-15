import 'package:flutter/material.dart';

class AddListButton extends StatelessWidget {
  const AddListButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      width: 78,
      child: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: onPressed,
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
