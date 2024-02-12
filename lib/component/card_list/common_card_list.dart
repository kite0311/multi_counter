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

  @override
  Widget build(BuildContext context) {
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
                      Expanded(
                        child: Container(
                          child: Text("リスト"),
                        ),
                      ),
                      // Color_Picker_Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Choose a Color!!'),
                                  content: SingleChildScrollView(
                                    child: BlockPicker(
                                      pickerColor: cardColors[index],
                                      //default color
                                      onColorChanged: (Color color) {
                                        //on color picked
                                        setState(
                                          () {
                                            cardColors[index] = color;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('DONE'),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); //dismiss the color picker
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(Icons.color_lens),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(40, 40),
                            shape: CircleBorder(),
                            side: BorderSide(color: Colors.white38, width: 3),
                            backgroundColor: Colors.tealAccent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.grey,
                            elevation: 4,
                          ),
                        ),
                      ),
                      //入力フォーム
                      Expanded(
                        child: Container(
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {}),
                        ),
                      ),
                      Row(
                        children: [
                          // 編集確定ボタン
                          Container(
                            // TODO テスト用のカラーを設定してるため後で編集
                            color: Colors.red,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('確定'),
                            ),
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
