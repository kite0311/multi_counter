import 'package:counter/component/appBar/common_bottom_appbar.dart';
import 'package:counter/component/card_list/common_card_list.dart';
import 'package:flutter/material.dart';

import 'component/button/common_floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi_Counter',
      home: const MyHomePage(title: 'Multi_Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  List<String> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CommonCardList(
                valueFromItemList: itemList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CommonFloatingActionButton(
        onPressed: () {
          setState(() {
            itemList.add('Item ${itemList.length + 1}');
          });
        },
      ),
      bottomNavigationBar: CommonBottomAppBar(),
    );
  }
}
