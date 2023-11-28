// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorRecentlyPlayedBlocState _$$ErrorRecentlyPlayedBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorRecentlyPlayedBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorRecentlyPlayedBlocStateToJson(
        _$ErrorRecentlyPlayedBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingRecentlyPlayedBlocState _$$LoadingRecentlyPlayedBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingRecentlyPlayedBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingRecentlyPlayedBlocStateToJson(
        _$LoadingRecentlyPlayedBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedRecentlyPlayedBlocState _$$LoadedRecentlyPlayedBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedRecentlyPlayedBlocState(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecentlyPlayedSong.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedRecentlyPlayedBlocStateToJson(
        _$LoadedRecentlyPlayedBlocState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
