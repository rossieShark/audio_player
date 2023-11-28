// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorGenresState _$$ErrorGenresStateFromJson(Map<String, dynamic> json) =>
    _$ErrorGenresState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorGenresStateToJson(_$ErrorGenresState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingGenresState _$$LoadingGenresStateFromJson(Map<String, dynamic> json) =>
    _$LoadingGenresState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingGenresStateToJson(
        _$LoadingGenresState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedGenresState _$$LoadedGenresStateFromJson(Map<String, dynamic> json) =>
    _$LoadedGenresState(
      data: (json['data'] as List<dynamic>)
          .map((e) => MusicGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedGenresStateToJson(_$LoadedGenresState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
