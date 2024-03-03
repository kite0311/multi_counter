import 'dart:math';

import 'package:counter/component/buttons/counter_button/cmn_dec_button.dart';
import 'package:counter/component/buttons/counter_button/cmn_incr_button.dart';
import 'package:counter/models/counter/counter_list.dart';
import 'package:counter/utils/generate_id.dart';
import 'package:counter/constant/theme/colors.dart';
import 'package:counter/constant/theme/size.dart';
import 'package:counter/component/buttons/add_list_button.dart';
import 'package:counter/component/buttons/color_picker_button.dart';
import 'package:counter/component/app_bar/bottom_app_bar/cmn_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterListPage extends StatefulWidget {
  const CounterListPage({
    super.key,
    required this.initializationValue,
  });

  /// リストの初期化値 Default: 5
  final int initializationValue;

  @override
  State<CounterListPage> createState() => _CounterListPageState();
}

class _CounterListPageState extends State<CounterListPage> {
  ///TODO 仮の値
  int result = 0;

  /// リストの総数をカウントして保持する変数
  //　TODO: ローカルDBで管理したいため後で削除予定
  late int listLengthCounter;

  /// アイテムリスト
  List<CounterList> itemlist = [];

  /// id生成用インスタンス
  var idGenerator = RandomIdGenerator();

  /// アイテムリスト生成
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

  /// 初期化時に渡された値をitemListに代入しリストを初期化 5つのリストを生成
  @override
  void initState() {
    super.initState();
    listLengthCounter = widget.initializationValue;
    print(listLengthCounter);
    itemlist = List<CounterList>.generate(
        widget.initializationValue, (index) => createCounterList(index + 1));
  }

  /// リストを追加
  void addItem() {
    setState(() {
      listLengthCounter++;
      print(listLengthCounter);
      itemlist.add(createCounterList(listLengthCounter));
    });
  }

  /// itemlistの色を更新
  void updateColor(Color color, int index) {
    setState(() {
      final currentItem = itemlist[index];
      itemlist[index] = currentItem.copyWith(color: color);
    });
  }

  /// itemlistの合計値を計算
  int calculateResult() {
    int total = 0;
    for (var item in itemlist) {
      total += item.settingVal;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result: $result',
          style: TextStyle(
            fontSize: CmnSize.f20,
            fontWeight: FontWeight.bold,
            color: CmnColor.red,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: itemlist.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(itemlist[index].id),
            // 左スワイプ時の背景UIの設定
            background: Container(
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
            ),
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
                    // カウンターボタン
                    Row(
                      children: [
                        CmnIncrButton(
                          onIncrement: itemlist[index].isSwitched &&
                                  itemlist[index].settingVal > 0
                              ? () {
                                  setState(() {
                                    final currentItem = itemlist[index];
                                    int newValue;
                                    if (currentItem.buttonClicks == 0) {
                                      // ボタンクリックが初めての場合は、settingValに加算せずに初期値を設定する
                                      newValue = currentItem.initialValue;
                                    } else {
                                      // それ以外の場合は、一回前のsettingValに加算する
                                      newValue = currentItem.settingVal +
                                          currentItem.initialValue;
                                    }
                                    // 更新された値でアイテムをリストに再代入する
                                    itemlist[index] = currentItem.copyWith(
                                        settingVal: newValue,
                                        buttonClicks:
                                            currentItem.buttonClicks + 1);

                                    // 結果の計算
                                    result = calculateResult();
                                  });
                                }
                              : () {},
                        ),
                        Text(itemlist[index].buttonClicks.toString(),
                            style: TextStyle(
                                fontSize: CmnSize.f24,
                                fontWeight: FontWeight.bold,
                                color: CmnColor.black)),
                        //TODO valueが0の場合にボタンが押せなくなる制御をする
                        CmnDecButton(
                          onDecrement: itemlist[index].isSwitched &&
                                  itemlist[index].settingVal > 0
                              ? () {
                                  setState(() {
                                    final currentItem = itemlist[index];
                                    // buttonClicksが0より大きいことを確認
                                    if (currentItem.buttonClicks > 0) {
                                      int newButtonClicks =
                                          currentItem.buttonClicks - 1;
                                      int newSettingVal =
                                          currentItem.settingVal -
                                              currentItem.initialValue;

                                      // 設定する値が0以下にならないように、以下でさらにチェックする
                                      newSettingVal = max(newSettingVal,
                                          0); // settingValが0未満にならないように
                                      newButtonClicks = max(newButtonClicks,
                                          0); // buttonClicksが0未満にならないように

                                      itemlist[index] = currentItem.copyWith(
                                        settingVal: newSettingVal,
                                        buttonClicks: newButtonClicks,
                                      );
                                    }
                                    result = calculateResult();
                                  });
                                }
                              : () {},
                        ),
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
        },
      ),
      // 画面下部UIの設定
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: AddListButton(
        onPressed: addItem,
      ),
      bottomNavigationBar: CmnBottomAppBar(itemList: itemlist),
    );
  }
}
