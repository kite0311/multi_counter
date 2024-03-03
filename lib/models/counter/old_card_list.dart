import 'package:flutter/material.dart';



class CardList {
  String id;
  String listname;
  Color listcolor;
  int _buttonClicks;
  int initialValue;
  int listSettingVal;
  bool isSwitched;

  int get buttonClicks => _buttonClicks;

  set buttonClicks(int value) {
    if (value > 0) {
      _buttonClicks = value;
    } else {
      _buttonClicks = 0;
    }
  }

  CardList({
    required this.id,
    required this.listname,
    required this.listcolor,
    required int buttonClicks,
    required this.initialValue,
    required this.listSettingVal,
    this.isSwitched = false,
  }) : _buttonClicks = buttonClicks > 0 ? buttonClicks : 0;
}
