import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerButton extends StatelessWidget {
  final List<Color> cardColors;
  final int index;
  final Function(Color, int) onColorChangedCallback;

  const ColorPickerButton(
      {super.key,
      required this.cardColors,
      required this.index,
      required this.onColorChangedCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Choose a Color!!'),
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
          },
        );
      },
      child: Icon(Icons.color_lens),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(40, 40),
        shape: CircleBorder(),
        side: BorderSide(color: Colors.white38, width: 3),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 4,
      ),
    );
  }
}
