// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BestAlbumsResponse _$BestAlbumsResponseFromJson(Map<String, dynamic> json) {
  return _BestAlbumsResponse.fromJson(json);
}

/// @nodoc
mixin _$BestAlbumsResponse {
  List<BestAlbumsList> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestAlbumsResponseCopyWith<BestAlbumsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestAlbumsResponseCopyWith<$Res> {
  factory $BestAlbumsResponseCopyWith(
          BestAlbumsResponse value, $Res Function(BestAlbumsResponse) then) =
      _$BestAlbumsResponseCopyWithImpl<$Res, BestAlbumsResponse>;
  @useResult
  $Res call({List<BestAlbumsList> data});
}

/// @nodoc
class _$BestAlbumsResponseCopyWithImpl<$Res, $Val extends BestAlbumsResponse>
    implements $BestAlbumsResponseCopyWith<$Res> {
  _$BestAlbumsResponseCopyWithImpl(this._value, this._then);

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
              as List<BestAlbumsList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BestAlbumsResponseImplCopyWith<$Res>
    implements $BestAlbumsResponseCopyWith<$Res> {
  factory _$$BestAlbumsResponseImplCopyWith(_$BestAlbumsResponseImpl value,
          $Res Function(_$BestAlbumsResponseImpl) then) =
      __$$BestAlbumsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BestAlbumsList> data});
}

/// @nodoc
class __$$BestAlbumsResponseImplCopyWithImpl<$Res>
    extends _$BestAlbumsResponseCopyWithImpl<$Res, _$BestAlbumsResponseImpl>
    implements _$$BestAlbumsResponseImplCopyWith<$Res> {
  __$$BestAlbumsResponseImplCopyWithImpl(_$BestAlbumsResponseImpl _value,
      $Res Function(_$BestAlbumsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BestAlbumsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BestAlbumsList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BestAlbumsResponseImpl implements _BestAlbumsResponse {
  _$BestAlbumsResponseImpl({required final List<BestAlbumsList> data})
      : _data = data;

  factory _$BestAlbumsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BestAlbumsResponseImplFromJson(json);

  final List<BestAlbumsList> _data;
  @override
  List<BestAlbumsList> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BestAlbumsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BestAlbumsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BestAlbumsResponseImplCopyWith<_$BestAlbumsResponseImpl> get copyWith =>
      __$$BestAlbumsResponseImplCopyWithImpl<_$BestAlbumsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BestAlbumsResponseImplToJson(
      this,
    );
  }
}

abstract class _BestAlbumsResponse implements BestAlbumsResponse {
  factory _BestAlbumsResponse({required final List<BestAlbumsList> data}) =
      _$BestAlbumsResponseImpl;

  factory _BestAlbumsResponse.fromJson(Map<String, dynamic> json) =
      _$BestAlbumsResponseImpl.fromJson;

  @override
  List<BestAlbumsList> get data;
  @override
  @JsonKey(ignore: true)
  _$$BestAlbumsResponseImplCopyWith<_$BestAlbumsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BestAlbumsList _$BestAlbumsListFromJson(Map<String, dynamic> json) {
  return _BestAlbumsList.fromJson(json);
}

/// @nodoc
mixin _$BestAlbumsList {
  AlbumArtist get artist => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_xl')
  String get coverImage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BestAlbumsListCopyWith<BestAlbumsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BestAlbumsListCopyWith<$Res> {
  factory $BestAlbumsListCopyWith(
          BestAlbumsList value, $Res Function(BestAlbumsList) then) =
      _$BestAlbumsListCopyWithImpl<$Res, BestAlbumsList>;
  @useResult
  $Res call(
      {AlbumArtist artist,
      int id,
      @JsonKey(name: 'cover_xl') String coverImage,
      String title,
      String type});

  $AlbumArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$BestAlbumsListCopyWithImpl<$Res, $Val extends BestAlbumsList>
    implements $BestAlbumsListCopyWith<$Res> {
  _$BestAlbumsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? id = null,
    Object? coverImage = null,
    Object? title = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as AlbumArtist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumArtistCopyWith<$Res> get artist {
    return $AlbumArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BestAlbumsListImplCopyWith<$Res>
    implements $BestAlbumsListCopyWith<$Res> {
  factory _$$BestAlbumsListImplCopyWith(_$BestAlbumsListImpl value,
          $Res Function(_$BestAlbumsListImpl) then) =
      __$$BestAlbumsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AlbumArtist artist,
      int id,
      @JsonKey(name: 'cover_xl') String coverImage,
      String title,
      String type});

  @override
  $AlbumArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$BestAlbumsListImplCopyWithImpl<$Res>
    extends _$BestAlbumsListCopyWithImpl<$Res, _$BestAlbumsListImpl>
    implements _$$BestAlbumsListImplCopyWith<$Res> {
  __$$BestAlbumsListImplCopyWithImpl(
      _$BestAlbumsListImpl _value, $Res Function(_$BestAlbumsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? id = null,
    Object? coverImage = null,
    Object? title = null,
    Object? type = null,
  }) {
    return _then(_$BestAlbumsListImpl(
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as AlbumArtist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BestAlbumsListImpl implements _BestAlbumsList {
  _$BestAlbumsListImpl(
      {required this.artist,
      required this.id,
      @JsonKey(name: 'cover_xl') required this.coverImage,
      required this.title,
      required this.type});

  factory _$BestAlbumsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$BestAlbumsListImplFromJson(json);

  @override
  final AlbumArtist artist;
  @override
  final int id;
  @override
  @JsonKey(name: 'cover_xl')
  final String coverImage;
  @override
  final String title;
  @override
  final String type;

  @override
  String toString() {
    return 'BestAlbumsList(artist: $artist, id: $id, coverImage: $coverImage, title: $title, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BestAlbumsListImpl &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, artist, id, coverImage, title, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BestAlbumsListImplCopyWith<_$BestAlbumsListImpl> get copyWith =>
      __$$BestAlbumsListImplCopyWithImpl<_$BestAlbumsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BestAlbumsListImplToJson(
      this,
    );
  }
}

abstract class _BestAlbumsList implements BestAlbumsList {
  factory _BestAlbumsList(
      {required final AlbumArtist artist,
      required final int id,
      @JsonKey(name: 'cover_xl') required final String coverImage,
      required final String title,
      required final String type}) = _$BestAlbumsListImpl;

  factory _BestAlbumsList.fromJson(Map<String, dynamic> json) =
      _$BestAlbumsListImpl.fromJson;

  @override
  AlbumArtist get artist;
  @override
  int get id;
  @override
  @JsonKey(name: 'cover_xl')
  String get coverImage;
  @override
  String get title;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$BestAlbumsListImplCopyWith<_$BestAlbumsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumArtist _$AlbumArtistFromJson(Map<String, dynamic> json) {
  return _AlbumArtist.fromJson(json);
}

/// @nodoc
mixin _$AlbumArtist {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumArtistCopyWith<AlbumArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumArtistCopyWith<$Res> {
  factory $AlbumArtistCopyWith(
          AlbumArtist value, $Res Function(AlbumArtist) then) =
      _$AlbumArtistCopyWithImpl<$Res, AlbumArtist>;
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class _$AlbumArtistCopyWithImpl<$Res, $Val extends AlbumArtist>
    implements $AlbumArtistCopyWith<$Res> {
  _$AlbumArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumArtistImplCopyWith<$Res>
    implements $AlbumArtistCopyWith<$Res> {
  factory _$$AlbumArtistImplCopyWith(
          _$AlbumArtistImpl value, $Res Function(_$AlbumArtistImpl) then) =
      __$$AlbumArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class __$$AlbumArtistImplCopyWithImpl<$Res>
    extends _$AlbumArtistCopyWithImpl<$Res, _$AlbumArtistImpl>
    implements _$$AlbumArtistImplCopyWith<$Res> {
  __$$AlbumArtistImplCopyWithImpl(
      _$AlbumArtistImpl _value, $Res Function(_$AlbumArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$AlbumArtistImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumArtistImpl implements _AlbumArtist {
  _$AlbumArtistImpl({required this.name, required this.id});

  factory _$AlbumArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumArtistImplFromJson(json);

  @override
  final String name;
  @override
  final int id;

  @override
  String toString() {
    return 'AlbumArtist(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumArtistImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumArtistImplCopyWith<_$AlbumArtistImpl> get copyWith =>
      __$$AlbumArtistImplCopyWithImpl<_$AlbumArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumArtistImplToJson(
      this,
    );
  }
}

abstract class _AlbumArtist implements AlbumArtist {
  factory _AlbumArtist({required final String name, required final int id}) =
      _$AlbumArtistImpl;

  factory _AlbumArtist.fromJson(Map<String, dynamic> json) =
      _$AlbumArtistImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$AlbumArtistImplCopyWith<_$AlbumArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
