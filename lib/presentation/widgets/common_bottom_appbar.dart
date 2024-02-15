import 'package:counter/presentation/widgets/buttons/Iconbutton/remove_list_button.dart';
import 'package:counter/presentation/widgets/buttons/Iconbutton/save_list_button.dart';
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
            SaveListButton(itemList: itemList),
            RemoveListButton(itemList: itemList,),
          ],
        ),
      ),
    );
  }
}
