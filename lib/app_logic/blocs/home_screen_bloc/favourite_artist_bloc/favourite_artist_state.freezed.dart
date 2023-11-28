// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_artist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteArtistState _$FavoriteArtistStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorFavoriteArtistState.fromJson(json);
    case 'loading':
      return LoadingFavoriteArtistState.fromJson(json);
    case 'loaded':
      return LoadedFavoriteArtistState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'FavoriteArtistState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$FavoriteArtistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<FavoriteArtist> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<FavoriteArtist> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<FavoriteArtist> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorFavoriteArtistState value) error,
    required TResult Function(LoadingFavoriteArtistState value) loading,
    required TResult Function(LoadedFavoriteArtistState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorFavoriteArtistState value)? error,
    TResult? Function(LoadingFavoriteArtistState value)? loading,
    TResult? Function(LoadedFavoriteArtistState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorFavoriteArtistState value)? error,
    TResult Function(LoadingFavoriteArtistState value)? loading,
    TResult Function(LoadedFavoriteArtistState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteArtistStateCopyWith<$Res> {
  factory $FavoriteArtistStateCopyWith(
          FavoriteArtistState value, $Res Function(FavoriteArtistState) then) =
      _$FavoriteArtistStateCopyWithImpl<$Res, FavoriteArtistState>;
}

/// @nodoc
class _$FavoriteArtistStateCopyWithImpl<$Res, $Val extends FavoriteArtistState>
    implements $FavoriteArtistStateCopyWith<$Res> {
  _$FavoriteArtistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorFavoriteArtistStateCopyWith<$Res> {
  factory _$$ErrorFavoriteArtistStateCopyWith(_$ErrorFavoriteArtistState value,
          $Res Function(_$ErrorFavoriteArtistState) then) =
      __$$ErrorFavoriteArtistStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorFavoriteArtistStateCopyWithImpl<$Res>
    extends _$FavoriteArtistStateCopyWithImpl<$Res, _$ErrorFavoriteArtistState>
    implements _$$ErrorFavoriteArtistStateCopyWith<$Res> {
  __$$ErrorFavoriteArtistStateCopyWithImpl(_$ErrorFavoriteArtistState _value,
      $Res Function(_$ErrorFavoriteArtistState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorFavoriteArtistState implements ErrorFavoriteArtistState {
  const _$ErrorFavoriteArtistState({final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorFavoriteArtistState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorFavoriteArtistStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FavoriteArtistState.error()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<FavoriteArtist> data) loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<FavoriteArtist> data)? loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<FavoriteArtist> data)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorFavoriteArtistState value) error,
    required TResult Function(LoadingFavoriteArtistState value) loading,
    required TResult Function(LoadedFavoriteArtistState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorFavoriteArtistState value)? error,
    TResult? Function(LoadingFavoriteArtistState value)? loading,
    TResult? Function(LoadedFavoriteArtistState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorFavoriteArtistState value)? error,
    TResult Function(LoadingFavoriteArtistState value)? loading,
    TResult Function(LoadedFavoriteArtistState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorFavoriteArtistStateToJson(
      this,
    );
  }
}

abstract class ErrorFavoriteArtistState implements FavoriteArtistState {
  const factory ErrorFavoriteArtistState() = _$ErrorFavoriteArtistState;

  factory ErrorFavoriteArtistState.fromJson(Map<String, dynamic> json) =
      _$ErrorFavoriteArtistState.fromJson;
}

/// @nodoc
abstract class _$$LoadingFavoriteArtistStateCopyWith<$Res> {
  factory _$$LoadingFavoriteArtistStateCopyWith(
          _$LoadingFavoriteArtistState value,
          $Res Function(_$LoadingFavoriteArtistState) then) =
      __$$LoadingFavoriteArtistStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFavoriteArtistStateCopyWithImpl<$Res>
    extends _$FavoriteArtistStateCopyWithImpl<$Res,
        _$LoadingFavoriteArtistState>
    implements _$$LoadingFavoriteArtistStateCopyWith<$Res> {
  __$$LoadingFavoriteArtistStateCopyWithImpl(
      _$LoadingFavoriteArtistState _value,
      $Res Function(_$LoadingFavoriteArtistState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingFavoriteArtistState implements LoadingFavoriteArtistState {
  const _$LoadingFavoriteArtistState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingFavoriteArtistState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingFavoriteArtistStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FavoriteArtistState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<FavoriteArtist> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<FavoriteArtist> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<FavoriteArtist> data)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorFavoriteArtistState value) error,
    required TResult Function(LoadingFavoriteArtistState value) loading,
    required TResult Function(LoadedFavoriteArtistState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorFavoriteArtistState value)? error,
    TResult? Function(LoadingFavoriteArtistState value)? loading,
    TResult? Function(LoadedFavoriteArtistState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorFavoriteArtistState value)? error,
    TResult Function(LoadingFavoriteArtistState value)? loading,
    TResult Function(LoadedFavoriteArtistState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingFavoriteArtistStateToJson(
      this,
    );
  }
}

abstract class LoadingFavoriteArtistState implements FavoriteArtistState {
  const factory LoadingFavoriteArtistState() = _$LoadingFavoriteArtistState;

  factory LoadingFavoriteArtistState.fromJson(Map<String, dynamic> json) =
      _$LoadingFavoriteArtistState.fromJson;
}

/// @nodoc
abstract class _$$LoadedFavoriteArtistStateCopyWith<$Res> {
  factory _$$LoadedFavoriteArtistStateCopyWith(
          _$LoadedFavoriteArtistState value,
          $Res Function(_$LoadedFavoriteArtistState) then) =
      __$$LoadedFavoriteArtistStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteArtist> data});
}

/// @nodoc
class __$$LoadedFavoriteArtistStateCopyWithImpl<$Res>
    extends _$FavoriteArtistStateCopyWithImpl<$Res, _$LoadedFavoriteArtistState>
    implements _$$LoadedFavoriteArtistStateCopyWith<$Res> {
  __$$LoadedFavoriteArtistStateCopyWithImpl(_$LoadedFavoriteArtistState _value,
      $Res Function(_$LoadedFavoriteArtistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedFavoriteArtistState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FavoriteArtist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedFavoriteArtistState implements LoadedFavoriteArtistState {
  const _$LoadedFavoriteArtistState(
      {required final List<FavoriteArtist> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedFavoriteArtistState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedFavoriteArtistStateFromJson(json);

  final List<FavoriteArtist> _data;
  @override
  List<FavoriteArtist> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FavoriteArtistState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedFavoriteArtistStateCopyWith<_$LoadedFavoriteArtistState>
      get copyWith => __$$LoadedFavoriteArtistStateCopyWithImpl<
          _$LoadedFavoriteArtistState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<FavoriteArtist> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<FavoriteArtist> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<FavoriteArtist> data)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorFavoriteArtistState value) error,
    required TResult Function(LoadingFavoriteArtistState value) loading,
    required TResult Function(LoadedFavoriteArtistState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorFavoriteArtistState value)? error,
    TResult? Function(LoadingFavoriteArtistState value)? loading,
    TResult? Function(LoadedFavoriteArtistState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorFavoriteArtistState value)? error,
    TResult Function(LoadingFavoriteArtistState value)? loading,
    TResult Function(LoadedFavoriteArtistState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedFavoriteArtistStateToJson(
      this,
    );
  }
}

abstract class LoadedFavoriteArtistState implements FavoriteArtistState {
  const factory LoadedFavoriteArtistState(
      {required final List<FavoriteArtist> data}) = _$LoadedFavoriteArtistState;

  factory LoadedFavoriteArtistState.fromJson(Map<String, dynamic> json) =
      _$LoadedFavoriteArtistState.fromJson;

  List<FavoriteArtist> get data;
  @JsonKey(ignore: true)
  _$$LoadedFavoriteArtistStateCopyWith<_$LoadedFavoriteArtistState>
      get copyWith => throw _privateConstructorUsedError;
}
