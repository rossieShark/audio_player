// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptySearchStateImpl _$$EmptySearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$EmptySearchStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptySearchStateImplToJson(
        _$EmptySearchStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingSearchStateImpl _$$LoadingSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadingSearchStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingSearchStateImplToJson(
        _$LoadingSearchStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NoResultsSearchStateImpl _$$NoResultsSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$NoResultsSearchStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NoResultsSearchStateImplToJson(
        _$NoResultsSearchStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedSearchStateImpl _$$LoadedSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadedSearchStateImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedSearchStateImplToJson(
        _$LoadedSearchStateImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
