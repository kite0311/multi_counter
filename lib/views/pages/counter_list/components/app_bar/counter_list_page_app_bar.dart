import 'package:counter/constants/theme/colors.dart';
import 'package:counter/constants/theme/size.dart';
import 'package:flutter/material.dart';

class CounterListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int result;

  const CounterListPageAppBar({
    super.key,
    required this.result,
  });

  @override
  Size get preferredSize => Size.fromHeight(CmnSize.h50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CmnColor.blue,
      title: Text(
        'Result: $result',
        style: const TextStyle(
          fontSize: CmnSize.f20,
          fontWeight: FontWeight.bold,
          color: CmnColor.red,
        ),
      ),
    );
  }
}