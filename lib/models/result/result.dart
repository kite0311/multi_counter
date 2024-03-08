import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required String result,
  }) = _Result;

factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
}