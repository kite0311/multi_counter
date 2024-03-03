// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterListImpl _$$CounterListImplFromJson(Map<String, dynamic> json) =>
    _$CounterListImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      color: const ColorConverter().fromJson(json['color'] as int),
      buttonClicks: json['buttonClicks'] as int,
      initialValue: json['initialValue'] as int,
      settingVal: json['settingVal'] as int,
      isSwitched: json['isSwitched'] as bool? ?? false,
    );

Map<String, dynamic> _$$CounterListImplToJson(_$CounterListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'buttonClicks': instance.buttonClicks,
      'initialValue': instance.initialValue,
      'settingVal': instance.settingVal,
      'isSwitched': instance.isSwitched,
    };
