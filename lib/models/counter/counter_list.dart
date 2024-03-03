import 'package:counter/models/counter/color_converter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_list.freezed.dart';
part 'counter_list.g.dart';

@freezed
class CounterList with _$CounterList {
  const factory CounterList({
    required String id,
    required String name,
    @ColorConverter() required Color color,
    required int buttonClicks,
    required int initialValue,
    required int settingVal,
    @Default(false) bool isSwitched,
  }) = _CounterList;

  factory CounterList.fromJson(Map<String, dynamic> json) =>
      _$CounterListFromJson(json);
}
