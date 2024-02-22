import 'package:flutter/material.dart';

class CardList {
  String id;
  String listname;
  Color listcolor;
  int initialValue;
  int listSettingVal;
  bool isSwitched;

  CardList({
    required this.id,
    required this.listname,
    required this.listcolor,
    required this.initialValue,
    required this.listSettingVal,
    this.isSwitched = false,
  });
}
