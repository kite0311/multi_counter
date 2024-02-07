import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'ListItem.dart';

class ListPageSampleTest extends StatefulWidget {
  const ListPageSampleTest({Key? key, required this.valueFromTextField})
      : super(key: key);
  final int valueFromTextField;

  @override
  State<ListPageSampleTest> createState() =>
      _ListPageSampleSecondState(value: valueFromTextField);
}

class _ListPageSampleSecondState extends State<ListPageSampleTest> {
  final int value;
  // リスト毎にカラーを持つためのリスト
  List<Color> cardColors = [];

  _ListPageSampleSecondState({required this.value}) {
    // リストの初期化
    cardColors = List.generate(value, (index) => Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リストページ'),
      ),
      body: Center(
        child: Container(
          // カードリストのUI
          child: ListView.builder(
            itemCount: value,
            itemBuilder: (context, index) {
              // ListItemDateからデータを取得
              String alphabet = ListItemData().alphabets[index];
              TextEditingController textEditingController =
                  TextEditingController();
              return Center(
                child: Card(
                  color: cardColors[index],
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(alphabet),
                            ),
                          ),
                          /*
                            Color_Picker_Button
                          */
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
                                side:
                                    BorderSide(color: Colors.white38, width: 3),
                                backgroundColor: Colors.tealAccent,
                                foregroundColor: Colors.white,
                                shadowColor: Colors.grey,
                                elevation: 4,
                              ),
                            ),
                          ),
                          /*
                            入力フォーム
                          */
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
        ),
      ),
    );
  }
}
