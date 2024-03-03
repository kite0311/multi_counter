import 'package:flutter/material.dart';

class CmnAppBar extends StatelessWidget {
  const CmnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Counter App'),
    );
  }
}
