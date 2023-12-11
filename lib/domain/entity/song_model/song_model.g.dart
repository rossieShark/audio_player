// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongDetailsResponceImpl _$$SongDetailsResponceImplFromJson(
        Map<String, dynamic> json) =>
    _$SongDetailsResponceImpl(
      contributors: (json['contributors'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      preview: json['preview'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$SongDetailsResponceImplToJson(
        _$SongDetailsResponceImpl instance) =>
    <String, dynamic>{
      'contributors': instance.contributors,
      'title': instance.title,
      'preview': instance.preview,
      'type': instance.type,
    };

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
      name: json['name'] as String,
      image: json['picture_big'] as String,
    );

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture_big': instance.image,
    };
