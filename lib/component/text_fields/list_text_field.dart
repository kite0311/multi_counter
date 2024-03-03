import 'package:flutter/material.dart';

class ListTextField extends StatelessWidget {
  const ListTextField({Key? key, required this.textEditingController})
      : super(key: key);

  final textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.number,
        controller: textEditingController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {});
  }
}
