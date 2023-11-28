// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_artist_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorFavoriteArtistState _$$ErrorFavoriteArtistStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorFavoriteArtistState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorFavoriteArtistStateToJson(
        _$ErrorFavoriteArtistState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingFavoriteArtistState _$$LoadingFavoriteArtistStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingFavoriteArtistState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingFavoriteArtistStateToJson(
        _$LoadingFavoriteArtistState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedFavoriteArtistState _$$LoadedFavoriteArtistStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedFavoriteArtistState(
      data: (json['data'] as List<dynamic>)
          .map((e) => FavoriteArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedFavoriteArtistStateToJson(
        _$LoadedFavoriteArtistState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
