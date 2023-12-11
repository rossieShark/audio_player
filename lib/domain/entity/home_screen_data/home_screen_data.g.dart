// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BestAlbumsResponseImpl _$$BestAlbumsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BestAlbumsResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => BestAlbumsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BestAlbumsResponseImplToJson(
        _$BestAlbumsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$BestAlbumsListImpl _$$BestAlbumsListImplFromJson(Map<String, dynamic> json) =>
    _$BestAlbumsListImpl(
      artist: AlbumArtist.fromJson(json['artist'] as Map<String, dynamic>),
      id: json['id'] as int,
      coverImage: json['cover_xl'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$BestAlbumsListImplToJson(
        _$BestAlbumsListImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'id': instance.id,
      'cover_xl': instance.coverImage,
      'title': instance.title,
      'type': instance.type,
    };

_$AlbumArtistImpl _$$AlbumArtistImplFromJson(Map<String, dynamic> json) =>
    _$AlbumArtistImpl(
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$AlbumArtistImplToJson(_$AlbumArtistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
