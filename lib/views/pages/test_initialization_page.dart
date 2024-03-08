import 'package:counter/component/buttons/initialization_button.dart';
import 'package:counter/views/pages/counter_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitializationPage extends StatelessWidget {
  const InitializationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            width: 200,
            height: 200,
            child: InitializationButton(
              onPressed: _navigateToListScreen,
              buttonText: 'tap to start',
            ),
          )
        ]),
      ),
    );
  }
}

void _navigateToListScreen(BuildContext context) {
context.read<CounterListModel>().initialize();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => CounterListPage(
        initializationValue: 0,
      ),
    ),
  );
}

class CounterListModel {
  void initialize() {}
}