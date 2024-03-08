import 'dart:math';

import 'package:counter/models/counter/counter_list.dart';
import 'package:counter/utils/generate_id.dart';
import 'package:flutter/material.dart';

class CounterListModel extends ChangeNotifier {
  late int listLengthCounter;
  late List<CounterList> _itemlist;
  final RandomIdGenerator idGenerator = RandomIdGenerator();

  CounterListModel(int initializationValue) {
    listLengthCounter = initializationValue;
    _itemlist = List<CounterList>.generate(
        initializationValue, (index) => createCounterList(index + 1));
  }

  List<CounterList> get itemlist => _itemlist;

  CounterList createCounterList(int index) {
    return CounterList(
      id: idGenerator.generate(),
      name: 'item$index',
      color: Colors.white,
      buttonClicks: 0,
      initialValue: 0,
      settingVal: 0,
      isSwitched: false,
    );
  }

  void addItem() {
    listLengthCounter++;
    _itemlist.add(createCounterList(listLengthCounter));
    notifyListeners();
  }

  void updateColor(Color color, int index) {
    final currentItem = _itemlist[index];
    _itemlist[index] = currentItem.copyWith(color: color);
    notifyListeners();
  }

  void handleIncrement(int index) {
    final currentItem = _itemlist[index];
    int newValue;
    if (currentItem.buttonClicks == 0) {
      newValue = currentItem.initialValue;
    } else {
      newValue = currentItem.settingVal + currentItem.initialValue;
    }
    _itemlist[index] = currentItem.copyWith(
        settingVal: newValue, buttonClicks: currentItem.buttonClicks + 1);
    notifyListeners();
  }

  void handleDecrement(int index) {
    final currentItem = _itemlist[index];
    if (currentItem.buttonClicks > 0) {
      int newButtonClicks = currentItem.buttonClicks - 1;
      int newSettingVal = currentItem.settingVal - currentItem.initialValue;
      newSettingVal = max(newSettingVal, 0);
      newButtonClicks = max(newButtonClicks, 0);
      _itemlist[index] = currentItem.copyWith(
        settingVal: newSettingVal,
        buttonClicks: newButtonClicks,
      );
    }
    notifyListeners();
  }

  int calculateResult() {
    int total = 0;
    for (var item in _itemlist) {
      total += item.settingVal;
    }
    return total;
  }
}
