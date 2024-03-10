import 'package:counter/constants/theme/colors.dart';
import 'package:counter/constants/theme/size.dart';
import 'package:counter/models/counter/counter_list.dart';
import 'package:counter/utils/generate_id.dart';
import 'package:counter/utils/handle_decrement.dart';
import 'package:counter/utils/handle_increment.dart';
import 'package:counter/views/pages/counter_list/components/buttons/color_picker_button.dart';
import 'package:counter/views/pages/counter_list/components/buttons/counter_button/decrement_button.dart';
import 'package:counter/views/pages/counter_list/components/buttons/counter_button/increment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterListItem extends StatefulWidget {
  final int initializationValue;
  final int index;

  const CounterListItem({
    super.key,
    required this.initializationValue,
    required this.index,
  });

  @override
  State<CounterListItem> createState() => _CounterListItemState();
}

class _CounterListItemState extends State<CounterListItem> {
  /// index of itemlist
  int index = 0;

  /// TODO 仮の値
  int result = 0;

  /// リストの総数をカウントして保持する変数
  //　TODO ローカルDBで管理したいため後で削除予定
  late int listLengthCounter;

  List<CounterList> itemlist = [];

  /// generate id instance
  var idGenerator = GenerateId();

  /// generate itemlist
  CounterList createCounterList(int index) {
    return CounterList(
      id: idGenerator.generate(),
      name: 'item$index',
      color: CmnColor.white,
      buttonClicks: 0,
      initialValue: 0,
      settingVal: 0,
    );
  }

  /// initialize itemlist
  @override
  void initState() {
    super.initState();
    index = widget.index;
    listLengthCounter = widget.initializationValue;
    print(listLengthCounter);
    itemlist = List<CounterList>.generate(
        widget.initializationValue, (index) => createCounterList(index + 1));
  }

  /// update itemlist color
  void updateColor(Color color, int index) {
    setState(() {
      final currentItem = itemlist[index];
      itemlist[index] = currentItem.copyWith(color: color);
    });
  }

  /// IncrementCounterCallBack
  void onIncrementCallback(int index) {
    setState(() {
      handleIncrement(itemlist, index, calculateResult);
    });
  }

  /// DecrementCounterCallBack
  void onDecrementCallback(int index) {
    setState(() {
      handleDecrement(itemlist, index, calculateResult);
    });
  }

  /// calculate result
  int calculateResult() {
    int total = 0;
    for (var item in itemlist) {
      total += item.settingVal;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(itemlist[index].id),
      // 左スワイプ時の背景UIの設定
      background: const LeftSwipeBackground(),
      // 左スワイプ時にスナックバーを表示
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // リストアイテム削除のロジック
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('DELETE ITEM!'),
            ),
          );
          setState(() {
            itemlist.removeAt(index);
          });
        }
      },
      direction: DismissDirection.endToStart,
      child: Card(
        color: itemlist[index].color,
        child: ListTile(
          // リスト名
          title: Text(itemlist[index].name),
          // リストの設定
          subtitle: Row(
            children: [
              ColorPickerButton(
                index: index,
                onColorChangedCallback: updateColor,
              ),
              Expanded(
                child: itemlist[index].isSwitched
                    ? Container(
                        child: Center(
                          child: Text(
                            itemlist[index].initialValue.toString(),
                            style: TextStyle(
                              fontSize: CmnSize.f24,
                              fontWeight: FontWeight.bold,
                              color: CmnColor.black,
                            ),
                          ),
                        ),
                      )
                    : TextField(
                        decoration: const InputDecoration(
                          labelText: 'Set Value',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(CmnSize.p8),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(7),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          setState(() {
                            final currentItem = itemlist[index];
                            itemlist[index] = currentItem.copyWith(
                              initialValue: int.parse(value),
                              settingVal: int.parse(value),
                            );
                          });
                        },
                      ),
              ),
              // Counter_Button
              Row(
                children: [
                  // Increment
                  IncrementButton(
                    isSwitched: itemlist[index].isSwitched,
                    settingVal: itemlist[index].settingVal,
                    onIncrement: () => onIncrementCallback(index),
                  ),
                  Text(itemlist[index].buttonClicks.toString(),
                      style: TextStyle(
                          fontSize: CmnSize.f24,
                          fontWeight: FontWeight.bold,
                          color: CmnColor.black)),
                  // Decrement
                  DecrementButton(
                      isSwitched: itemlist[index].isSwitched,
                      settingVal: itemlist[index].settingVal,
                      onDecrement: () => onDecrementCallback(index)),
                ],
              ),
            ],
          ),
          // itemlist確定スイッチボタン
          trailing: Switch(
            value: itemlist[index].isSwitched,
            onChanged: (value) => setState(() {
              final currentValue = itemlist[index];
              itemlist[index] = currentValue.copyWith(isSwitched: value);
            }),
          ),
        ),
      ),
    );
  }
}

// 左スワイプ時(item削除時)の背景UI
class LeftSwipeBackground extends StatelessWidget {
  const LeftSwipeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CmnColor.red,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          // 右端中央にアイコンを配置
          padding: EdgeInsets.only(right: CmnSize.p32),
          child: Icon(
            Icons.delete,
            size: CmnSize.i32,
            color: CmnColor.black,
          ),
        ),
      ),
    );
  }
}
