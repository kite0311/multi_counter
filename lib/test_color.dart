import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class testColor extends StatefulWidget {
  const testColor({super.key});

  @override
  State<testColor> createState() => _testColorState();
}

class _testColorState extends State<testColor> {
  Color mycolor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Color Picker"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            color: mycolor, //background color of app from color picker
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: mycolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  mycolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("Default Color Picker"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: MaterialPicker(
                              pickerColor: mycolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  mycolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("Material Color Picker"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: mycolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  mycolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("Block Color Picker"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: MultipleChoiceBlockPicker(
                              pickerColors: [
                                Colors.red,
                                Colors.orange
                              ], //default color
                              onColorsChanged: (List<Color> colors) {
                                //on colors picked
                                print(colors);
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text("Multiple Choice Color Picker"),
              ),
            ])));
  }
}
