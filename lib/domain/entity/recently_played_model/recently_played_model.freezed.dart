// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentlyPlayedResponse _$RecentlyPlayedResponseFromJson(
    Map<String, dynamic> json) {
  return _RecentlyPlayedResponse.fromJson(json);
}

/// @nodoc
mixin _$RecentlyPlayedResponse {
  Tracks get tracks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentlyPlayedResponseCopyWith<RecentlyPlayedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedResponseCopyWith<$Res> {
  factory $RecentlyPlayedResponseCopyWith(RecentlyPlayedResponse value,
          $Res Function(RecentlyPlayedResponse) then) =
      _$RecentlyPlayedResponseCopyWithImpl<$Res, RecentlyPlayedResponse>;
  @useResult
  $Res call({Tracks tracks});

  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class _$RecentlyPlayedResponseCopyWithImpl<$Res,
        $Val extends RecentlyPlayedResponse>
    implements $RecentlyPlayedResponseCopyWith<$Res> {
  _$RecentlyPlayedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TracksCopyWith<$Res> get tracks {
    return $TracksCopyWith<$Res>(_value.tracks, (value) {
      return _then(_value.copyWith(tracks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentlyPlayedResponseImplCopyWith<$Res>
    implements $RecentlyPlayedResponseCopyWith<$Res> {
  factory _$$RecentlyPlayedResponseImplCopyWith(
          _$RecentlyPlayedResponseImpl value,
          $Res Function(_$RecentlyPlayedResponseImpl) then) =
      __$$RecentlyPlayedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tracks tracks});

  @override
  $TracksCopyWith<$Res> get tracks;
}

/// @nodoc
class __$$RecentlyPlayedResponseImplCopyWithImpl<$Res>
    extends _$RecentlyPlayedResponseCopyWithImpl<$Res,
        _$RecentlyPlayedResponseImpl>
    implements _$$RecentlyPlayedResponseImplCopyWith<$Res> {
  __$$RecentlyPlayedResponseImplCopyWithImpl(
      _$RecentlyPlayedResponseImpl _value,
      $Res Function(_$RecentlyPlayedResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$RecentlyPlayedResponseImpl(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as Tracks,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentlyPlayedResponseImpl implements _RecentlyPlayedResponse {
  _$RecentlyPlayedResponseImpl({required this.tracks});

  factory _$RecentlyPlayedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentlyPlayedResponseImplFromJson(json);

  @override
  final Tracks tracks;

  @override
  String toString() {
    return 'RecentlyPlayedResponse(tracks: $tracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentlyPlayedResponseImpl &&
            (identical(other.tracks, tracks) || other.tracks == tracks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tracks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentlyPlayedResponseImplCopyWith<_$RecentlyPlayedResponseImpl>
      get copyWith => __$$RecentlyPlayedResponseImplCopyWithImpl<
          _$RecentlyPlayedResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentlyPlayedResponseImplToJson(
      this,
    );
  }
}

abstract class _RecentlyPlayedResponse implements RecentlyPlayedResponse {
  factory _RecentlyPlayedResponse({required final Tracks tracks}) =
      _$RecentlyPlayedResponseImpl;

  factory _RecentlyPlayedResponse.fromJson(Map<String, dynamic> json) =
      _$RecentlyPlayedResponseImpl.fromJson;

  @override
  Tracks get tracks;
  @override
  @JsonKey(ignore: true)
  _$$RecentlyPlayedResponseImplCopyWith<_$RecentlyPlayedResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Tracks _$TracksFromJson(Map<String, dynamic> json) {
  return _Tracks.fromJson(json);
}

/// @nodoc
mixin _$Tracks {
  List<TracksData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TracksCopyWith<Tracks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksCopyWith<$Res> {
  factory $TracksCopyWith(Tracks value, $Res Function(Tracks) then) =
      _$TracksCopyWithImpl<$Res, Tracks>;
  @useResult
  $Res call({List<TracksData> data});
}

/// @nodoc
class _$TracksCopyWithImpl<$Res, $Val extends Tracks>
    implements $TracksCopyWith<$Res> {
  _$TracksCopyWithImpl(this._value, this._then);

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
              as List<TracksData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TracksImplCopyWith<$Res> implements $TracksCopyWith<$Res> {
  factory _$$TracksImplCopyWith(
          _$TracksImpl value, $Res Function(_$TracksImpl) then) =
      __$$TracksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TracksData> data});
}

/// @nodoc
class __$$TracksImplCopyWithImpl<$Res>
    extends _$TracksCopyWithImpl<$Res, _$TracksImpl>
    implements _$$TracksImplCopyWith<$Res> {
  __$$TracksImplCopyWithImpl(
      _$TracksImpl _value, $Res Function(_$TracksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TracksImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TracksData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TracksImpl implements _Tracks {
  _$TracksImpl({required final List<TracksData> data}) : _data = data;

  factory _$TracksImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksImplFromJson(json);

  final List<TracksData> _data;
  @override
  List<TracksData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Tracks(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksImplCopyWith<_$TracksImpl> get copyWith =>
      __$$TracksImplCopyWithImpl<_$TracksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksImplToJson(
      this,
    );
  }
}

abstract class _Tracks implements Tracks {
  factory _Tracks({required final List<TracksData> data}) = _$TracksImpl;

  factory _Tracks.fromJson(Map<String, dynamic> json) = _$TracksImpl.fromJson;

  @override
  List<TracksData> get data;
  @override
  @JsonKey(ignore: true)
  _$$TracksImplCopyWith<_$TracksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TracksData _$TracksDataFromJson(Map<String, dynamic> json) {
  return _TracksData.fromJson(json);
}

/// @nodoc
mixin _$TracksData {
  String get title => throw _privateConstructorUsedError;
  Artist get artist => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TracksDataCopyWith<TracksData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracksDataCopyWith<$Res> {
  factory $TracksDataCopyWith(
          TracksData value, $Res Function(TracksData) then) =
      _$TracksDataCopyWithImpl<$Res, TracksData>;
  @useResult
  $Res call({String title, Artist artist, int id, String preview, String type});

  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class _$TracksDataCopyWithImpl<$Res, $Val extends TracksData>
    implements $TracksDataCopyWith<$Res> {
  _$TracksDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artist = null,
    Object? id = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistCopyWith<$Res> get artist {
    return $ArtistCopyWith<$Res>(_value.artist, (value) {
      return _then(_value.copyWith(artist: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TracksDataImplCopyWith<$Res>
    implements $TracksDataCopyWith<$Res> {
  factory _$$TracksDataImplCopyWith(
          _$TracksDataImpl value, $Res Function(_$TracksDataImpl) then) =
      __$$TracksDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Artist artist, int id, String preview, String type});

  @override
  $ArtistCopyWith<$Res> get artist;
}

/// @nodoc
class __$$TracksDataImplCopyWithImpl<$Res>
    extends _$TracksDataCopyWithImpl<$Res, _$TracksDataImpl>
    implements _$$TracksDataImplCopyWith<$Res> {
  __$$TracksDataImplCopyWithImpl(
      _$TracksDataImpl _value, $Res Function(_$TracksDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artist = null,
    Object? id = null,
    Object? preview = null,
    Object? type = null,
  }) {
    return _then(_$TracksDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as Artist,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
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
class _$TracksDataImpl implements _TracksData {
  _$TracksDataImpl(
      {required this.title,
      required this.artist,
      required this.id,
      required this.preview,
      required this.type});

  factory _$TracksDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TracksDataImplFromJson(json);

  @override
  final String title;
  @override
  final Artist artist;
  @override
  final int id;
  @override
  final String preview;
  @override
  final String type;

  @override
  String toString() {
    return 'TracksData(title: $title, artist: $artist, id: $id, preview: $preview, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracksDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, artist, id, preview, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TracksDataImplCopyWith<_$TracksDataImpl> get copyWith =>
      __$$TracksDataImplCopyWithImpl<_$TracksDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TracksDataImplToJson(
      this,
    );
  }
}

abstract class _TracksData implements TracksData {
  factory _TracksData(
      {required final String title,
      required final Artist artist,
      required final int id,
      required final String preview,
      required final String type}) = _$TracksDataImpl;

  factory _TracksData.fromJson(Map<String, dynamic> json) =
      _$TracksDataImpl.fromJson;

  @override
  String get title;
  @override
  Artist get artist;
  @override
  int get id;
  @override
  String get preview;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TracksDataImplCopyWith<_$TracksDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_big')
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image, int id});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistImplCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$ArtistImplCopyWith(
          _$ArtistImpl value, $Res Function(_$ArtistImpl) then) =
      __$$ArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'picture_big') String image, int id});
}

/// @nodoc
class __$$ArtistImplCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$ArtistImpl>
    implements _$$ArtistImplCopyWith<$Res> {
  __$$ArtistImplCopyWithImpl(
      _$ArtistImpl _value, $Res Function(_$ArtistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_$ArtistImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$ArtistImpl implements _Artist {
  _$ArtistImpl(
      {required this.name,
      @JsonKey(name: 'picture_big') required this.image,
      required this.id});

  factory _$ArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'picture_big')
  final String image;
  @override
  final int id;

  @override
  String toString() {
    return 'Artist(name: $name, image: $image, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      __$$ArtistImplCopyWithImpl<_$ArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistImplToJson(
      this,
    );
  }
}

abstract class _Artist implements Artist {
  factory _Artist(
      {required final String name,
      @JsonKey(name: 'picture_big') required final String image,
      required final int id}) = _$ArtistImpl;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$ArtistImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'picture_big')
  String get image;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
