import 'package:counter/views/pages/counter_list/components/buttons/save_list_button.dart';
import 'package:counter/models/counter/counter_list.dart';
import 'package:flutter/material.dart';

class CounterListPageBottomAppBar extends StatelessWidget {
  const CounterListPageBottomAppBar({super.key, required this.itemList});

  final List<CounterList> itemList;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.blue,
      notchMargin: 10.0,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SaveListButton(itemList: itemList),
          ],
        ),
      ),
    );
  }
}
