import 'package:counter/presentation/widgets/buttons/add_list_button.dart';
import 'package:counter/presentation/widgets/card_list/common_card_list.dart';
import 'package:counter/presentation/widgets/common_bottom_appbar.dart';
import 'package:counter/presentation/widgets/total_item_count.dart';
import 'package:flutter/material.dart';

class CardListPage extends StatefulWidget {
  const CardListPage({super.key, required this.InitialItems});

  final List<String> InitialItems;

  @override
  State<CardListPage> createState() => _CardListState();
}

class _CardListState extends State<CardListPage> {
  // itemListをlate修飾子で初期化
  late List<String> itemList = [];

  @override
  void initState() {
    super.initState();
    // 初期化時に渡された値をitemListに代入し初期化
    itemList = List<String>.from(widget.InitialItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Multi Counter App'),
        actions: [
          // 合計値を表示するウィジェット
          TotalItemCountWidget(totalItemCount: itemList.length),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CommonCardList(
                valueFromItemList: itemList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: AddListButton(
        onPressed: () {
          setState(() {
            itemList.add('Item ${itemList.length + 1}');
          });
        },
      ),
      bottomNavigationBar: CommonBottomAppBar(itemList: itemList),
    );
  }
}
