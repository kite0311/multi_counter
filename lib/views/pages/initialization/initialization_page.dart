import 'package:counter/constants/button_text_constants.dart';
import 'package:counter/constants/list_constants.dart';
import 'package:counter/views/pages/counter_list/counter_list_page.dart';
import 'package:counter/constants/theme/size.dart';
import 'package:counter/views/pages/counter_list/components/buttons/initialization_button.dart';
import 'package:flutter/material.dart';

class InitializationPage extends StatelessWidget {
  const InitializationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // リストを初期化するボタン
            Container(
              width: CmnSize.c200,
              height: CmnSize.c200,
              child: const InitializationButton(
                onPressed: _navigateToListScreen,
                buttonText: ButtonText.tapToStart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// リスト画面に遷移
void _navigateToListScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const CounterListPage(
        initializationValue: ListConstants.initializationValue,
      ),
    ),
  );
}
