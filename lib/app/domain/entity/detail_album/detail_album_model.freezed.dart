// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumDetailsResponse _$AlbumDetailsResponseFromJson(Map<String, dynamic> json) {
  return _AlbumDetailsResponce.fromJson(json);
}

/// @nodoc
mixin _$AlbumDetailsResponse {
  List<AlbumData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDetailsResponseCopyWith<AlbumDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailsResponseCopyWith<$Res> {
  factory $AlbumDetailsResponseCopyWith(AlbumDetailsResponse value,
          $Res Function(AlbumDetailsResponse) then) =
      _$AlbumDetailsResponseCopyWithImpl<$Res, AlbumDetailsResponse>;
  @useResult
  $Res call({List<AlbumData> data});
}

/// @nodoc
class _$AlbumDetailsResponseCopyWithImpl<$Res,
        $Val extends AlbumDetailsResponse>
    implements $AlbumDetailsResponseCopyWith<$Res> {
  _$AlbumDetailsResponseCopyWithImpl(this._value, this._then);

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
              as List<AlbumData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumDetailsResponceImplCopyWith<$Res>
    implements $AlbumDetailsResponseCopyWith<$Res> {
  factory _$$AlbumDetailsResponceImplCopyWith(_$AlbumDetailsResponceImpl value,
          $Res Function(_$AlbumDetailsResponceImpl) then) =
      __$$AlbumDetailsResponceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AlbumData> data});
}

/// @nodoc
class __$$AlbumDetailsResponceImplCopyWithImpl<$Res>
    extends _$AlbumDetailsResponseCopyWithImpl<$Res, _$AlbumDetailsResponceImpl>
    implements _$$AlbumDetailsResponceImplCopyWith<$Res> {
  __$$AlbumDetailsResponceImplCopyWithImpl(_$AlbumDetailsResponceImpl _value,
      $Res Function(_$AlbumDetailsResponceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AlbumDetailsResponceImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AlbumData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDetailsResponceImpl implements _AlbumDetailsResponce {
  _$AlbumDetailsResponceImpl({required final List<AlbumData> data})
      : _data = data;

  factory _$AlbumDetailsResponceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDetailsResponceImplFromJson(json);

  final List<AlbumData> _data;
  @override
  List<AlbumData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AlbumDetailsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDetailsResponceImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDetailsResponceImplCopyWith<_$AlbumDetailsResponceImpl>
      get copyWith =>
          __$$AlbumDetailsResponceImplCopyWithImpl<_$AlbumDetailsResponceImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDetailsResponceImplToJson(
      this,
    );
  }
}

abstract class _AlbumDetailsResponce implements AlbumDetailsResponse {
  factory _AlbumDetailsResponce({required final List<AlbumData> data}) =
      _$AlbumDetailsResponceImpl;

  factory _AlbumDetailsResponce.fromJson(Map<String, dynamic> json) =
      _$AlbumDetailsResponceImpl.fromJson;

  @override
  List<AlbumData> get data;
  @override
  @JsonKey(ignore: true)
  _$$AlbumDetailsResponceImplCopyWith<_$AlbumDetailsResponceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) {
  return _AlbumData.fromJson(json);
}

/// @nodoc
mixin _$AlbumData {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  AlbumDataArtist get artist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDataCopyWith<AlbumData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDataCopyWith<$Res> {
  factory $AlbumDataCopyWith(AlbumData value, $Res Function(AlbumData) then) =
      _$AlbumDataCopyWithImpl<$Res, AlbumData>;
  @useResult
  $Res call(
      {int id,
      String title,
      String type,
      String preview,
      AlbumDataArtist artist});

  $AlbumDataArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$AlbumDataCopyWithImpl<$Res, $Val extends AlbumData>
    implements $AlbumDataCopyWith<$Res> {
  _$AlbumDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? preview = null,
    Object? artist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as AlbumDataArtist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlbumDataArtistCopyWith<$Res> get artist {
    return $AlbumDataArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlbumDataImplCopyWith<$Res>
    implements $AlbumDataCopyWith<$Res> {
  factory _$$AlbumDataImplCopyWith(
          _$AlbumDataImpl value, $Res Function(_$AlbumDataImpl) then) =
      __$$AlbumDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String type,
      String preview,
      AlbumDataArtist artist});

  @override
  $AlbumDataArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$AlbumDataImplCopyWithImpl<$Res>
    extends _$AlbumDataCopyWithImpl<$Res, _$AlbumDataImpl>
    implements _$$AlbumDataImplCopyWith<$Res> {
  __$$AlbumDataImplCopyWithImpl(
      _$AlbumDataImpl _value, $Res Function(_$AlbumDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? preview = null,
    Object? artist = null,
  }) {
    return _then(_$AlbumDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as AlbumDataArtist,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDataImpl implements _AlbumData {
  _$AlbumDataImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.preview,
      required this.artist});

  factory _$AlbumDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDataImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String type;
  @override
  final String preview;
  @override
  final AlbumDataArtist artist;

  @override
  String toString() {
    return 'AlbumData(id: $id, title: $title, type: $type, preview: $preview, artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, preview, artist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDataImplCopyWith<_$AlbumDataImpl> get copyWith =>
      __$$AlbumDataImplCopyWithImpl<_$AlbumDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDataImplToJson(
      this,
    );
  }
}

abstract class _AlbumData implements AlbumData {
  factory _AlbumData(
      {required final int id,
      required final String title,
      required final String type,
      required final String preview,
      required final AlbumDataArtist artist}) = _$AlbumDataImpl;

  factory _AlbumData.fromJson(Map<String, dynamic> json) =
      _$AlbumDataImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get type;
  @override
  String get preview;
  @override
  AlbumDataArtist get artist;
  @override
  @JsonKey(ignore: true)
  _$$AlbumDataImplCopyWith<_$AlbumDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumDataArtist _$AlbumDataArtistFromJson(Map<String, dynamic> json) {
  return _AlbumDataArtist.fromJson(json);
}

/// @nodoc
mixin _$AlbumDataArtist {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDataArtistCopyWith<AlbumDataArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDataArtistCopyWith<$Res> {
  factory $AlbumDataArtistCopyWith(
          AlbumDataArtist value, $Res Function(AlbumDataArtist) then) =
      _$AlbumDataArtistCopyWithImpl<$Res, AlbumDataArtist>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$AlbumDataArtistCopyWithImpl<$Res, $Val extends AlbumDataArtist>
    implements $AlbumDataArtistCopyWith<$Res> {
  _$AlbumDataArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumDataArtistImplCopyWith<$Res>
    implements $AlbumDataArtistCopyWith<$Res> {
  factory _$$AlbumDataArtistImplCopyWith(_$AlbumDataArtistImpl value,
          $Res Function(_$AlbumDataArtistImpl) then) =
      __$$AlbumDataArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$AlbumDataArtistImplCopyWithImpl<$Res>
    extends _$AlbumDataArtistCopyWithImpl<$Res, _$AlbumDataArtistImpl>
    implements _$$AlbumDataArtistImplCopyWith<$Res> {
  __$$AlbumDataArtistImplCopyWithImpl(
      _$AlbumDataArtistImpl _value, $Res Function(_$AlbumDataArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$AlbumDataArtistImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDataArtistImpl implements _AlbumDataArtist {
  _$AlbumDataArtistImpl({required this.name});

  factory _$AlbumDataArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDataArtistImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'AlbumDataArtist(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDataArtistImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDataArtistImplCopyWith<_$AlbumDataArtistImpl> get copyWith =>
      __$$AlbumDataArtistImplCopyWithImpl<_$AlbumDataArtistImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDataArtistImplToJson(
      this,
    );
  }
}

abstract class _AlbumDataArtist implements AlbumDataArtist {
  factory _AlbumDataArtist({required final String name}) =
      _$AlbumDataArtistImpl;

  factory _AlbumDataArtist.fromJson(Map<String, dynamic> json) =
      _$AlbumDataArtistImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$AlbumDataArtistImplCopyWith<_$AlbumDataArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
