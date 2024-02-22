import 'package:counter/domain/types/card_list.dart';
import 'package:counter/presentation/widgets/buttons/Iconbutton/save_list_button.dart';
import 'package:flutter/material.dart';

class CmnBottomAppBar extends StatelessWidget {
  const CmnBottomAppBar({super.key, required this.itemList});

  final List<CardList> itemList;

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
