import 'package:counter/domain/types/card_list.dart';
import 'package:counter/domain/features/generate_id.dart';
import 'package:counter/presentation/theme/colors.dart';
import 'package:counter/presentation/theme/size.dart';
import 'package:counter/presentation/widgets/buttons/add_list_button.dart';
import 'package:counter/presentation/widgets/buttons/color_picker_button.dart';
import 'package:counter/presentation/widgets/buttons/counter_button/cmn_dec_button.dart';
import 'package:counter/presentation/widgets/buttons/counter_button/cmn_incr_button.dart';
import 'package:counter/presentation/widgets/cmn_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    super.key,
    required this.initializationValue,
  });

  /// リストの初期化値 Default: 5
  final int initializationValue;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ///TODO 仮の値
  int result = 0;

  /// リストの総数をカウントして保持する変数
  //　TODO: ローカルDBで管理したいため後で削除予定
  late int listLengthCounter;

  /// アイテムリスト
  List<CardList> itemlist = [];

  /// id生成用インスタンス
  var idGenerator = RandomIdGenerator();

  /// アイテムリスト生成
  CardList createCardList(int index) {
    return CardList(
        id: idGenerator.generate(),
        listname: 'item$index',
        listcolor: CmnColor.white,
        buttonClicks: 0,
        initialValue: 0,
        listSettingVal: 0, 
        );
  }

  /// 初期化時に渡された値をitemListに代入しリストを初期化 5つのリストを生成
  @override
  void initState() {
    super.initState();
    listLengthCounter = widget.initializationValue;
    print(listLengthCounter);
    itemlist = List<CardList>.generate(
        widget.initializationValue, (index) => createCardList(index + 1));
  }

  /// リストを追加
  void addItem() {
    setState(() {
      listLengthCounter++;
      print(listLengthCounter);
      itemlist.add(createCardList(listLengthCounter));
    });
  }

  /// itemlistの色を更新
  void updateColor(Color color, int index) {
    setState(() {
      itemlist[index].listcolor = color;
    });
  }

  /// itemlistの合計値を計算
  int caluculateResult() {
    int total = 0;
    for (var item in itemlist) {
      total += item.listSettingVal;
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
            key: ValueKey<CardList>(itemlist[index]),
            child: Card(
              color: itemlist[index].listcolor,
              child: ListTile(
                // リスト名
                title: Text(itemlist[index].listname),
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
                                  itemlist[index].initialValue =
                                      int.parse(value);
                                  itemlist[index].listSettingVal =
                                      int.parse(value);
                                });
                              },
                            ),
                    ),
                    // カウンターボタン
                    Row(
                      children: [
                        CmnIncrButton(
                          onIncrement: itemlist[index].isSwitched
                              ? () {
                                  setState(() {
                                    itemlist[index].listSettingVal +=
                                        itemlist[index].initialValue;
                                    itemlist[index].buttonClicks++;
                                    result = caluculateResult();
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
                          onDecrement: itemlist[index].isSwitched
                              ? () {
                                  setState(() {
                                    itemlist[index].listSettingVal -=
                                        itemlist[index].initialValue;
                                    itemlist[index].buttonClicks--;
                                    result = caluculateResult();
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
                    itemlist[index].isSwitched = value;
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
