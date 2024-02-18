import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerButton extends StatelessWidget {
  final List<Color> cardColors;
  final int index;
  final Function(Color, int) onColorChangedCallback;

  const ColorPickerButton({
    Key? key,
    required this.cardColors,
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
            return ColorPickerDialog(
                cardColors: cardColors,
                index: index,
                onColorChangedCallback: (Color color, int index) {
                  onColorChangedCallback(color, index);
                });
          },
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 40),
        shape: const CircleBorder(),
        side: const BorderSide(color: Colors.white38, width: 3),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 4,
      ),
      child: const Icon(Icons.color_lens),
    );
  }
}

// ColorPickerのダイアログ
class ColorPickerDialog extends StatelessWidget {
  final List<Color> cardColors;
  final int index;
  final Function(Color, int) onColorChangedCallback;

  const ColorPickerDialog({
    Key? key,
    required this.cardColors,
    required this.index,
    required this.onColorChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose a Color!!'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: cardColors[index],
          //default color
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
  }
}
