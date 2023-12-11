// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenresResponseImpl _$$GenresResponseImplFromJson(Map<String, dynamic> json) =>
    _$GenresResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenresResponseImplToJson(
        _$GenresResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['picture_big'] as String,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture_big': instance.image,
    };
