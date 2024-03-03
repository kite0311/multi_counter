// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CounterList _$CounterListFromJson(Map<String, dynamic> json) {
  return _CounterList.fromJson(json);
}

/// @nodoc
mixin _$CounterList {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  int get buttonClicks => throw _privateConstructorUsedError;
  int get initialValue => throw _privateConstructorUsedError;
  int get settingVal => throw _privateConstructorUsedError;
  bool get isSwitched => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterListCopyWith<CounterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterListCopyWith<$Res> {
  factory $CounterListCopyWith(
          CounterList value, $Res Function(CounterList) then) =
      _$CounterListCopyWithImpl<$Res, CounterList>;
  @useResult
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      int buttonClicks,
      int initialValue,
      int settingVal,
      bool isSwitched});
}

/// @nodoc
class _$CounterListCopyWithImpl<$Res, $Val extends CounterList>
    implements $CounterListCopyWith<$Res> {
  _$CounterListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? buttonClicks = null,
    Object? initialValue = null,
    Object? settingVal = null,
    Object? isSwitched = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonClicks: null == buttonClicks
          ? _value.buttonClicks
          : buttonClicks // ignore: cast_nullable_to_non_nullable
              as int,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int,
      settingVal: null == settingVal
          ? _value.settingVal
          : settingVal // ignore: cast_nullable_to_non_nullable
              as int,
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterListImplCopyWith<$Res>
    implements $CounterListCopyWith<$Res> {
  factory _$$CounterListImplCopyWith(
          _$CounterListImpl value, $Res Function(_$CounterListImpl) then) =
      __$$CounterListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      int buttonClicks,
      int initialValue,
      int settingVal,
      bool isSwitched});
}

/// @nodoc
class __$$CounterListImplCopyWithImpl<$Res>
    extends _$CounterListCopyWithImpl<$Res, _$CounterListImpl>
    implements _$$CounterListImplCopyWith<$Res> {
  __$$CounterListImplCopyWithImpl(
      _$CounterListImpl _value, $Res Function(_$CounterListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? buttonClicks = null,
    Object? initialValue = null,
    Object? settingVal = null,
    Object? isSwitched = null,
  }) {
    return _then(_$CounterListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonClicks: null == buttonClicks
          ? _value.buttonClicks
          : buttonClicks // ignore: cast_nullable_to_non_nullable
              as int,
      initialValue: null == initialValue
          ? _value.initialValue
          : initialValue // ignore: cast_nullable_to_non_nullable
              as int,
      settingVal: null == settingVal
          ? _value.settingVal
          : settingVal // ignore: cast_nullable_to_non_nullable
              as int,
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterListImpl implements _CounterList {
  const _$CounterListImpl(
      {required this.id,
      required this.name,
      @ColorConverter() required this.color,
      required this.buttonClicks,
      required this.initialValue,
      required this.settingVal,
      this.isSwitched = false});

  factory _$CounterListImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterListImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @ColorConverter()
  final Color color;
  @override
  final int buttonClicks;
  @override
  final int initialValue;
  @override
  final int settingVal;
  @override
  @JsonKey()
  final bool isSwitched;

  @override
  String toString() {
    return 'CounterList(id: $id, name: $name, color: $color, buttonClicks: $buttonClicks, initialValue: $initialValue, settingVal: $settingVal, isSwitched: $isSwitched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.buttonClicks, buttonClicks) ||
                other.buttonClicks == buttonClicks) &&
            (identical(other.initialValue, initialValue) ||
                other.initialValue == initialValue) &&
            (identical(other.settingVal, settingVal) ||
                other.settingVal == settingVal) &&
            (identical(other.isSwitched, isSwitched) ||
                other.isSwitched == isSwitched));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, buttonClicks,
      initialValue, settingVal, isSwitched);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterListImplCopyWith<_$CounterListImpl> get copyWith =>
      __$$CounterListImplCopyWithImpl<_$CounterListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterListImplToJson(
      this,
    );
  }
}

abstract class _CounterList implements CounterList {
  const factory _CounterList(
      {required final String id,
      required final String name,
      @ColorConverter() required final Color color,
      required final int buttonClicks,
      required final int initialValue,
      required final int settingVal,
      final bool isSwitched}) = _$CounterListImpl;

  factory _CounterList.fromJson(Map<String, dynamic> json) =
      _$CounterListImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @ColorConverter()
  Color get color;
  @override
  int get buttonClicks;
  @override
  int get initialValue;
  @override
  int get settingVal;
  @override
  bool get isSwitched;
  @override
  @JsonKey(ignore: true)
  _$$CounterListImplCopyWith<_$CounterListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
