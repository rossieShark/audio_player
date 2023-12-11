// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteArtistResponseImpl _$$FavouriteArtistResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FavouriteArtistResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavouriteArtistResponseImplToJson(
        _$FavouriteArtistResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ArtistsImpl _$$ArtistsImplFromJson(Map<String, dynamic> json) =>
    _$ArtistsImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['picture_big'] as String,
    );

Map<String, dynamic> _$$ArtistsImplToJson(_$ArtistsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture_big': instance.image,
    };
