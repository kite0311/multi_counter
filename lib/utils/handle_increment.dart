import 'package:counter/models/counter/counter_list.dart';

void handleIncrement(
    List<CounterList> itemlist, int index, void Function() calculateResult) {
  // 現在のアイテムを取得
  final currentItem = itemlist[index];
  int newValue;
  if (currentItem.buttonClicks == 0) {
    // ボタンクリックが初めての場合は、settingValに加算せずに初期値を設定する
    newValue = currentItem.initialValue;
  } else {
    // それ以外の場合は、一回前のsettingValに加算する
    newValue = currentItem.settingVal + currentItem.initialValue;
  }
  // 更新された値でアイテムをリストに再代入する
  itemlist[index] = currentItem.copyWith(
      settingVal: newValue, buttonClicks: currentItem.buttonClicks + 1);

  // 結果の計算
  calculateResult();
}
