import 'package:counter/views/pages/initialization/initialization_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Multi_Counter',
      home: InitializationPage(),
    );
  }
}
