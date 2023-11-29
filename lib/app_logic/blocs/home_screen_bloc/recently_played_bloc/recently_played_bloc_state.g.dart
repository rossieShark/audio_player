// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_bloc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorRecentlyPlayedState _$$ErrorRecentlyPlayedStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorRecentlyPlayedState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorRecentlyPlayedStateToJson(
        _$ErrorRecentlyPlayedState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingRecentlyPlayedState _$$LoadingRecentlyPlayedStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingRecentlyPlayedState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingRecentlyPlayedStateToJson(
        _$LoadingRecentlyPlayedState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedRecentlyPlayedState _$$LoadedRecentlyPlayedStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedRecentlyPlayedState(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecentlyPlayedSong.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedRecentlyPlayedStateToJson(
        _$LoadedRecentlyPlayedState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
