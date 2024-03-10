import 'package:counter/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerButton extends StatelessWidget {
  final int index;
  final Function(Color, int) onColorChangedCallback;

  ColorPickerButton({
    Key? key,
    required this.index,
    required this.onColorChangedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Choose a Color!!'),
              content: SingleChildScrollView(
                child: BlockPicker(
                  // default color
                  pickerColor: CmnColor.white,
                  // Color changed
                  onColorChanged: (Color color) {
                    //color picked
                    onColorChangedCallback(color, index);
                  },
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('DONE'),
                  onPressed: () {
                    Navigator.of(context).pop(); //dismiss the color picker
                  },
                ),
              ],
            );
          },
        );
      },
      // ColorPickerButtonのスタイル
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(color: CmnColor.grey, width: 3),
        backgroundColor: CmnColor.tealAccent,
        foregroundColor: CmnColor.white,
        shadowColor: CmnColor.grey,
        elevation: 4,
      ),
      child: const Icon(Icons.color_lens),
    );
  }
}
