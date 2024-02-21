import 'package:counter/presentation/theme/colors.dart';
import 'package:counter/presentation/theme/size.dart';
import 'package:flutter/material.dart';

class CmndecButton extends StatelessWidget {
  const CmndecButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.remove_circle_outline,
        color: CmnColor.black,
      ),
      iconSize: CmnSize.i26,
      onPressed: () {
        //TODO 減少処理
      },
    );
  }
}