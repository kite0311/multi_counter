import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'counter_list.freezed.dart';
class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int Value) => Color(Value);

  @override
  int toJson(Color color) => color.value;
}