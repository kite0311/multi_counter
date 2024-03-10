import 'package:counter/constants/theme/colors.dart';
import 'package:counter/constants/theme/icons.dart';
import 'package:counter/constants/theme/size.dart';
import 'package:counter/widgets/common_button_catalog.dart';
import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CmnSize.h78,
      width: CmnSize.w78,
      child: CommonAddItemButton(
        onPressed: onPressed,
        iconColor: CmnColor.blue,
        iconData: CmnIcons.addItemIcon,
      ),
    );
  }
}
