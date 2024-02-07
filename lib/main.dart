import 'package:counter/list_page.dart';
import 'package:counter/old.dart';
import 'package:counter/ListPageSampleTest.dart';
import 'package:flutter/material.dart';
import 'package:counter/test_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '最初のページ',
            ),
            SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      number = int.tryParse(value) ?? 0;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPageSample(value: number),
                ),
              );
            },
            child: const Icon(Icons.navigate_next_sharp),
          ),
          SizedBox(
            height: 30,
          ),
          // 確定ボタンありページ
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListPageSampleTest(valueFromTextField: number),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              child: const Icon(Icons.navigate_next_sharp),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => testColor(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              child: const Icon(Icons.navigate_next_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
