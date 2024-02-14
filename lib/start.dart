import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}
// 初期画面
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 丸いelevatedボタン
            ElevatedButton(
              onPressed: () {
                // ボタンを押したら、アラートを表示
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('アラート'),
                      content: const Text('アラートの内容'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('アラートを表示'),
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
