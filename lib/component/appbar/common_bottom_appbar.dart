import 'package:counter/component/button/IconButton/list_remove_button.dart';
import 'package:counter/component/button/IconButton/list_save_button.dart';
import 'package:flutter/material.dart';

class CommonBottomAppBar extends StatelessWidget {
  const CommonBottomAppBar({super.key, required this.itemList});

  final List<String> itemList;

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
            ListSaveButton(itemList: itemList),
            ListRemoveButton(itemList: itemList,),
          ],
        ),
      ),
    );
  }
}
