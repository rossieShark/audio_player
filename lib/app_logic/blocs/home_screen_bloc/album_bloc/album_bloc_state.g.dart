// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_bloc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorAlbumState _$$ErrorAlbumStateFromJson(Map<String, dynamic> json) =>
    _$ErrorAlbumState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorAlbumStateToJson(_$ErrorAlbumState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingAlbumState _$$LoadingAlbumStateFromJson(Map<String, dynamic> json) =>
    _$LoadingAlbumState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingAlbumStateToJson(_$LoadingAlbumState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedAlbumState _$$LoadedAlbumStateFromJson(Map<String, dynamic> json) =>
    _$LoadedAlbumState(
      data: (json['data'] as List<dynamic>)
          .map((e) => BestAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedAlbumStateToJson(_$LoadedAlbumState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
