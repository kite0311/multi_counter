import 'package:counter/component/button/colot_picker_button.dart';
import 'package:counter/component/textfield/list_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CommonCardList extends StatefulWidget {
  const CommonCardList({Key? key, required this.valueFromItemList})
      : super(key: key);
  final int valueFromItemList;

  @override
  State<CommonCardList> createState() =>
      _CommonCardListState(value: valueFromItemList);
}

class _CommonCardListState extends State<CommonCardList> {
  int value;

  // リスト毎にカラーを持つためのリスト
  List<Color> cardColors = [];

  _CommonCardListState({required this.value}) {
    // リストの初期化
    cardColors = List.generate(value, (index) => Colors.white);
  }

  @override
  void didUpdateWidget(covariant CommonCardList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueFromItemList != widget.valueFromItemList) {
      value = widget.valueFromItemList;
      cardColors = List.generate(value, (index) => Colors.white);
    }
  }

  void onColorChanged(Color color, int index) {
    setState(() {
      cardColors[index] = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // スイッチの初期値
    bool isSwitched = false;

    return Container(
      // カードリストのUI
      child: ListView.builder(
        itemCount: value,
        itemBuilder: (context, index) {
          TextEditingController textEditingController = TextEditingController();
          return Center(
            child: Card(
              color: cardColors[index],
              child: SizedBox(
                width: double.infinity,
                height: 74,
                child: Center(
                  child: Row(
                    children: [
                      // Color_Picker_Button
                      Expanded(
                        child: ColorPickerButton(
                            cardColors: cardColors,
                            index: index,
                            onColorChangedCallback: onColorChanged),
                      ),
                      // テーブル名
                      Expanded(
                        child: Container(
                          child: Text("リスト"),
                        ),
                      ),
                      // 入力フォーム
                      Expanded(
                        child: Container(
                          child: ListTextField(
                              textEditingController: textEditingController),
                        ),
                      ),
                      // プラスボタン
                      Row(
                        children: [
                          Container(
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.black,
                              ),
                              iconSize: 26,
                              onPressed: () {},
                            ),
                          ),
                          // マイナスボタン
                          Container(
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.black,
                              ),
                              iconSize: 26,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          // 入力値確定スイッチ
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
