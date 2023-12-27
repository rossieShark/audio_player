// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serch_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextChangedSearchEventImpl _$$TextChangedSearchEventImplFromJson(
        Map<String, dynamic> json) =>
    _$TextChangedSearchEventImpl(
      newText: json['newText'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextChangedSearchEventImplToJson(
        _$TextChangedSearchEventImpl instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$LoadSearchEventImpl _$$LoadSearchEventImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadSearchEventImpl(
      newText: json['newText'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadSearchEventImplToJson(
        _$LoadSearchEventImpl instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$LoadMoreItemsSearchEventImpl _$$LoadMoreItemsSearchEventImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadMoreItemsSearchEventImpl(
      text: json['text'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadMoreItemsSearchEventImplToJson(
        _$LoadMoreItemsSearchEventImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$FilterFetchResultSearchEventImpl _$$FilterFetchResultSearchEventImplFromJson(
        Map<String, dynamic> json) =>
    _$FilterFetchResultSearchEventImpl(
      text: json['text'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FilterFetchResultSearchEventImplToJson(
        _$FilterFetchResultSearchEventImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };
