import 'package:counter/presentation/pages/initial.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi_Counter',
      home: InitialPage(),
    );
  }
}