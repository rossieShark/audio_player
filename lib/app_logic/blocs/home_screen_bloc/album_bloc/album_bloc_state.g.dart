// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_bloc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorAlbumBlocState _$$ErrorAlbumBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorAlbumBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorAlbumBlocStateToJson(
        _$ErrorAlbumBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingAlbumBlocState _$$LoadingAlbumBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingAlbumBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingAlbumBlocStateToJson(
        _$LoadingAlbumBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedAlbumBlocState _$$LoadedAlbumBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedAlbumBlocState(
      data: (json['data'] as List<dynamic>)
          .map((e) => BestAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedAlbumBlocStateToJson(
        _$LoadedAlbumBlocState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
