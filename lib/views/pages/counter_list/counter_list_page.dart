import 'package:counter/models/counter/counter_list.dart';
import 'package:counter/utils/generate_id.dart';
import 'package:counter/constants/theme/colors.dart';
import 'package:counter/views/pages/counter_list/components/buttons/add_item_button.dart';
import 'package:counter/views/pages/counter_list/components/app_bar/counter_list_page_app_bar.dart';
import 'package:counter/views/pages/counter_list/components/app_bar/counter_list_page_bottom_app_bar.dart';
import 'package:counter/views/pages/counter_list/components/list_item/counter_list_item.dart';
import 'package:flutter/material.dart';

class CounterListPage extends StatefulWidget {
  /// リストの初期化値 Default: 5
  final int initializationValue;

  const CounterListPage({
    super.key,
    required this.initializationValue,
  });

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
  var idGenerator = GenerateId();

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

  /// initialize itemlist
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
    result = calculateResult();

    return Scaffold(
      appBar: CounterListPageAppBar(
        result: result,
      ),
      body: ListView.builder(
        itemCount: itemlist.length,
        itemBuilder: (context, index) {
          return CounterListItem(
            initializationValue: widget.initializationValue,
            index: index,
          );
        },
      ),
      // 画面下部UIの設定
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: AddItemButton(
        onPressed: addItem,
      ),
      bottomNavigationBar: CounterListPageBottomAppBar(itemList: itemlist),
    );
  }
}
