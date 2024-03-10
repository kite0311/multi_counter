import 'dart:math';

import 'package:counter/models/counter/counter_list.dart';

void handleDecrement(
    List<CounterList> itemlist, int index, void Function() calculateResult) {
  final currentItem = itemlist[index];
  // buttonClicksが0より大きいことを確認
  if (currentItem.buttonClicks > 0) {
    int newButtonClicks = currentItem.buttonClicks - 1;
    int newSettingVal = currentItem.settingVal - currentItem.initialValue;

    // 設定する値が0以下にならないように、以下でさらにチェックする
    newSettingVal = max(newSettingVal, 0); // settingValが0未満にならないように
    newButtonClicks = max(newButtonClicks, 0); // buttonClicksが0未満にならないように

    itemlist[index] = currentItem.copyWith(
      settingVal: newSettingVal,
      buttonClicks: newButtonClicks,
    );
  }
  // 結果の計算
  calculateResult();
}
