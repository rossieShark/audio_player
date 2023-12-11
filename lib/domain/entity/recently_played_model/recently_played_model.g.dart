// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_played_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentlyPlayedResponseImpl _$$RecentlyPlayedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentlyPlayedResponseImpl(
      tracks: Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecentlyPlayedResponseImplToJson(
        _$RecentlyPlayedResponseImpl instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };

_$TracksImpl _$$TracksImplFromJson(Map<String, dynamic> json) => _$TracksImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => TracksData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TracksImplToJson(_$TracksImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$TracksDataImpl _$$TracksDataImplFromJson(Map<String, dynamic> json) =>
    _$TracksDataImpl(
      title: json['title'] as String,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
      id: json['id'] as int,
      preview: json['preview'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$TracksDataImplToJson(_$TracksDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'id': instance.id,
      'preview': instance.preview,
      'type': instance.type,
    };

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
      name: json['name'] as String,
      image: json['picture_big'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture_big': instance.image,
      'id': instance.id,
    };
