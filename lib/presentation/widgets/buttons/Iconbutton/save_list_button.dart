import 'package:flutter/material.dart';

class SaveListButton extends StatelessWidget {
  const SaveListButton({super.key, required this.itemList});

  final List<String> itemList;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.save,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
