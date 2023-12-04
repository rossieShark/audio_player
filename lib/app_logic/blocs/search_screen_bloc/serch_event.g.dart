// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serch_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextChangedSearchEvent _$$TextChangedSearchEventFromJson(
        Map<String, dynamic> json) =>
    _$TextChangedSearchEvent(
      newText: json['newText'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextChangedSearchEventToJson(
        _$TextChangedSearchEvent instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$LoadSearchEvent _$$LoadSearchEventFromJson(Map<String, dynamic> json) =>
    _$LoadSearchEvent(
      newText: json['newText'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadSearchEventToJson(_$LoadSearchEvent instance) =>
    <String, dynamic>{
      'newText': instance.newText,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$LoadMoreItemsSearchEvent _$$LoadMoreItemsSearchEventFromJson(
        Map<String, dynamic> json) =>
    _$LoadMoreItemsSearchEvent(
      text: json['text'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadMoreItemsSearchEventToJson(
        _$LoadMoreItemsSearchEvent instance) =>
    <String, dynamic>{
      'text': instance.text,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };

_$FilterFetchResultSearchEvent _$$FilterFetchResultSearchEventFromJson(
        Map<String, dynamic> json) =>
    _$FilterFetchResultSearchEvent(
      text: json['text'] as String,
      filter: json['filter'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FilterFetchResultSearchEventToJson(
        _$FilterFetchResultSearchEvent instance) =>
    <String, dynamic>{
      'text': instance.text,
      'filter': instance.filter,
      'runtimeType': instance.$type,
    };
