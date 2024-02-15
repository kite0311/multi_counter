import 'package:counter/presentation/widgets/buttons/add_list_button.dart';
import 'package:counter/presentation/widgets/card_list/common_card_list.dart';
import 'package:counter/presentation/widgets/common_bottom_appbar.dart';
import 'package:flutter/material.dart';


class CardListPage extends StatefulWidget {
  const CardListPage({super.key});

  @override
  State<CardListPage> createState() => _CardListScreen();
}

class _CardListScreen extends State<CardListPage> {
  int number = 0;
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('multi_counter'),
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
