import 'package:counter/presentation/theme/size.dart';
import 'package:flutter/material.dart';

class TotalItemCountWidget extends StatelessWidget {
  const TotalItemCountWidget({super.key, required this.totalItemCount});

  final int totalItemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CmnSize.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total: Items: $totalItemCount',
            style: const TextStyle(fontSize: CmnSize.f16),
          ),
        ],
      ),
    );
  }
}
