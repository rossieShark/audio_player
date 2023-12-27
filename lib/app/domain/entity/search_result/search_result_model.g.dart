// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultResponceImpl _$$SearchResultResponceImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchResultResponceImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchResultResponceImplToJson(
        _$SearchResultResponceImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$SearchDataImpl _$$SearchDataImplFromJson(Map<String, dynamic> json) =>
    _$SearchDataImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      preview: json['preview'] as String,
      artist: SearchDataArtist.fromJson(json['artist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchDataImplToJson(_$SearchDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'preview': instance.preview,
      'artist': instance.artist,
    };

_$SearchDataArtistImpl _$$SearchDataArtistImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchDataArtistImpl(
      image: json['picture_big'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SearchDataArtistImplToJson(
        _$SearchDataArtistImpl instance) =>
    <String, dynamic>{
      'picture_big': instance.image,
      'name': instance.name,
    };
