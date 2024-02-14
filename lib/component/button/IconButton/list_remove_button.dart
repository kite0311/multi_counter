import 'package:flutter/material.dart';

class ListRemoveButton extends StatelessWidget {
  const ListRemoveButton({super.key, required this.itemList});

  final List<String> itemList;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.remove_circle_outline,
        color: Colors.white,
      ),
      iconSize: 26,
      onPressed: () {
        itemList.remove(itemList.length - 1);
      },
    );
  }
}
