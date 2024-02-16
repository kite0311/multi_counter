import 'package:counter/presentation/constants/button_text_constants.dart';
import 'package:counter/presentation/constants/list_constants.dart';
import 'package:counter/presentation/pages/card_list.dart';
import 'package:counter/presentation/theme/size.dart';
import 'package:counter/presentation/widgets/buttons/initialization_button.dart';
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
              width: CommonSize.c200,
              height: CommonSize.c200,
              child: const InitializationButton(
                onPressed: onPressed,
                ButtonText: ButtonText.tapToStart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListPageに遷移する処理
void onPressed(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => CardListPage(
          InitialItems: List.generate(
              ListConstantsValue.listInitializationValue,
              (index) => 'Item ${index + 1}')),
    ),
  );
}
