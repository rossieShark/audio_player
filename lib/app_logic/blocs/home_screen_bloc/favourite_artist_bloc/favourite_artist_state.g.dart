// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_artist_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorFavoriteArtistBlocState _$$ErrorFavoriteArtistBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$ErrorFavoriteArtistBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorFavoriteArtistBlocStateToJson(
        _$ErrorFavoriteArtistBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadingFavoriteArtistBlocState _$$LoadingFavoriteArtistBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadingFavoriteArtistBlocState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingFavoriteArtistBlocStateToJson(
        _$LoadingFavoriteArtistBlocState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LoadedFavoriteArtistBlocState _$$LoadedFavoriteArtistBlocStateFromJson(
        Map<String, dynamic> json) =>
    _$LoadedFavoriteArtistBlocState(
      data: (json['data'] as List<dynamic>)
          .map((e) => FavoriteArtist.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadedFavoriteArtistBlocStateToJson(
        _$LoadedFavoriteArtistBlocState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };
