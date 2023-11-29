// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorGenresBlocState _$$ErrorGenresBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorGenresBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorGenresBlocStateToJson(
        _$ErrorGenresBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingGenresBlocState _$$LoadingGenresBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingGenresBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingGenresBlocStateToJson(
        _$LoadingGenresBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedGenresBlocState _$$LoadedGenresBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedGenresBlocState(
      data: (json['data'] as List<dynamic>)
          .map((e) => MusicGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedGenresBlocStateToJson(
        _$LoadedGenresBlocState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
