// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumDetailsResponceImpl _$$AlbumDetailsResponceImplFromJson(
        Map<String, dynamic> json) =>
    _$AlbumDetailsResponceImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => AlbumData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AlbumDetailsResponceImplToJson(
        _$AlbumDetailsResponceImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$AlbumDataImpl _$$AlbumDataImplFromJson(Map<String, dynamic> json) =>
    _$AlbumDataImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      preview: json['preview'] as String,
      artist: AlbumDataArtist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AlbumDataImplToJson(_$AlbumDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'preview': instance.preview,
      'artist': instance.artist,
    };

_$AlbumDataArtistImpl _$$AlbumDataArtistImplFromJson(
        Map<String, dynamic> json) =>
    _$AlbumDataArtistImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AlbumDataArtistImplToJson(
        _$AlbumDataArtistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
