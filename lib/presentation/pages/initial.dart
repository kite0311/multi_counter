import 'package:counter/presentation/pages/card_list.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 丸いelevatedボタン
            //TODO 初期画面を修正するため一時的に設定している
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CardListPage(),
                  ),
                );
              },
              child: Text('test'),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                maximumSize: Size(100, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
