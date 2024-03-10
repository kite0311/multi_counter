import 'package:counter/constants/theme/colors.dart';
import 'package:counter/constants/theme/icons.dart';
import 'package:counter/constants/theme/size.dart';
import 'package:counter/widgets/common_button_catalog.dart';
import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  final VoidCallback? onIncrement;
  final bool isSwitched;
  final int settingVal;

  const IncrementButton({
    super.key,
    required this.onIncrement,
    required this.isSwitched,
    required this.settingVal,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCounterButton(
      iconData: CmnIcons.decrementIcon,
      iconColor: CmnColor.darkgrey,
      iconSize: CmnSize.i26,
      onPressed: isSwitched && settingVal >= 0 ? onIncrement : null,
    );
  }
}
