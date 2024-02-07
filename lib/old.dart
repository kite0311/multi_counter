import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counter/ListItem.dart';

class ListPageSampleSecond extends StatelessWidget {
  const ListPageSampleSecond({super.key, required this.value});

  final int value;

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
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // TODO テスト用のカラーを設定してるため後で編集
                              color: Colors.blue,
                              child: Text(alphabet),
                            ),
                          ),

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

class cardList extends StatelessWidget {
  const cardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
