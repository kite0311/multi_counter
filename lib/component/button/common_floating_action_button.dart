import 'package:flutter/material.dart';

import '../../ListPageSampleTest.dart';

class CommonFloatingActionButton extends StatelessWidget {
  const CommonFloatingActionButton({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Theme.of(context).primaryColorDark,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ListPageSampleTest(valueFromTextField: number),
          ),
        );
      },
      child: const Icon(Icons.navigate_next_sharp),
    );
  }
}
