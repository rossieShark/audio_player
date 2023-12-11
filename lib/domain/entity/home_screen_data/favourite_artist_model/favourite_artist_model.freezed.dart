// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_artist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavouriteArtistResponse _$FavouriteArtistResponseFromJson(
    Map<String, dynamic> json) {
  return _FavouriteArtistResponse.fromJson(json);
}

/// @nodoc
mixin _$FavouriteArtistResponse {
  List<Artists> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteArtistResponseCopyWith<FavouriteArtistResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteArtistResponseCopyWith<$Res> {
  factory $FavouriteArtistResponseCopyWith(FavouriteArtistResponse value,
          $Res Function(FavouriteArtistResponse) then) =
      _$FavouriteArtistResponseCopyWithImpl<$Res, FavouriteArtistResponse>;
  @useResult
  $Res call({List<Artists> data});
}

/// @nodoc
class _$FavouriteArtistResponseCopyWithImpl<$Res,
        $Val extends FavouriteArtistResponse>
    implements $FavouriteArtistResponseCopyWith<$Res> {
  _$FavouriteArtistResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Artists>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteArtistResponseImplCopyWith<$Res>
    implements $FavouriteArtistResponseCopyWith<$Res> {
  factory _$$FavouriteArtistResponseImplCopyWith(
          _$FavouriteArtistResponseImpl value,
          $Res Function(_$FavouriteArtistResponseImpl) then) =
      __$$FavouriteArtistResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artists> data});
}

/// @nodoc
class __$$FavouriteArtistResponseImplCopyWithImpl<$Res>
    extends _$FavouriteArtistResponseCopyWithImpl<$Res,
        _$FavouriteArtistResponseImpl>
    implements _$$FavouriteArtistResponseImplCopyWith<$Res> {
  __$$FavouriteArtistResponseImplCopyWithImpl(
      _$FavouriteArtistResponseImpl _value,
      $Res Function(_$FavouriteArtistResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FavouriteArtistResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Artists>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteArtistResponseImpl implements _FavouriteArtistResponse {
  _$FavouriteArtistResponseImpl({required final List<Artists> data})
      : _data = data;

  factory _$FavouriteArtistResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteArtistResponseImplFromJson(json);

  final List<Artists> _data;
  @override
  List<Artists> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavouriteArtistResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteArtistResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteArtistResponseImplCopyWith<_$FavouriteArtistResponseImpl>
      get copyWith => __$$FavouriteArtistResponseImplCopyWithImpl<
          _$FavouriteArtistResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteArtistResponseImplToJson(
      this,
    );
  }
}

abstract class _FavouriteArtistResponse implements FavouriteArtistResponse {
  factory _FavouriteArtistResponse({required final List<Artists> data}) =
      _$FavouriteArtistResponseImpl;

  factory _FavouriteArtistResponse.fromJson(Map<String, dynamic> json) =
      _$FavouriteArtistResponseImpl.fromJson;

  @override
  List<Artists> get data;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteArtistResponseImplCopyWith<_$FavouriteArtistResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return _Artists.fromJson(json);
}

/// @nodoc
mixin _$Artists {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistsCopyWith<Artists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistsCopyWith<$Res> {
  factory $ArtistsCopyWith(Artists value, $Res Function(Artists) then) =
      _$ArtistsCopyWithImpl<$Res, Artists>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'picture_big') String image});
}

/// @nodoc
class _$ArtistsCopyWithImpl<$Res, $Val extends Artists>
    implements $ArtistsCopyWith<$Res> {
  _$ArtistsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistsImplCopyWith<$Res> implements $ArtistsCopyWith<$Res> {
  factory _$$ArtistsImplCopyWith(
          _$ArtistsImpl value, $Res Function(_$ArtistsImpl) then) =
      __$$ArtistsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'picture_big') String image});
}

/// @nodoc
class __$$ArtistsImplCopyWithImpl<$Res>
    extends _$ArtistsCopyWithImpl<$Res, _$ArtistsImpl>
    implements _$$ArtistsImplCopyWith<$Res> {
  __$$ArtistsImplCopyWithImpl(
      _$ArtistsImpl _value, $Res Function(_$ArtistsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$ArtistsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistsImpl implements _Artists {
  _$ArtistsImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'picture_big') required this.image});

  factory _$ArtistsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'picture_big')
  final String image;

  @override
  String toString() {
    return 'Artists(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistsImplCopyWith<_$ArtistsImpl> get copyWith =>
      __$$ArtistsImplCopyWithImpl<_$ArtistsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistsImplToJson(
      this,
    );
  }
}

abstract class _Artists implements Artists {
  factory _Artists(
          {required final int id,
          required final String name,
          @JsonKey(name: 'picture_big') required final String image}) =
      _$ArtistsImpl;

  factory _Artists.fromJson(Map<String, dynamic> json) = _$ArtistsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ArtistsImplCopyWith<_$ArtistsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
