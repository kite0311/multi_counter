import 'package:counter/constant/list_constants.dart';
import 'package:counter/views/pages/counter_list_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//TODO 初期画面のボタン実装 初期画面に移管できたら消す
class InitializeButton extends StatefulWidget {
  const InitializeButton({super.key});

  @override
  State<InitializeButton> createState() => _InitializeButtonState();
}

class _InitializeButtonState extends State<InitializeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.forward();
                  _isTapped = true;
                });
                _navigateToListScreen(context);
              },
              child: Lottie.asset(
                'assets/wavebutton.json',
                controller: _controller,
              ),
            ),
            Switch(
              value: _isTapped,
              onChanged: (value) {
                setState(() {
                  _isTapped = value;
                  if (!_isTapped) {
                    _controller.reset(); // Reset the animation
                  }
                });
              },
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
