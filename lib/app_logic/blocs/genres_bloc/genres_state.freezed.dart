// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genres_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenresBlocState _$GenresBlocStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorGenresBlocState.fromJson(json);
    case 'loading':
      return LoadingGenresBlocState.fromJson(json);
    case 'loaded':
      return LoadedGenresBlocState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GenresBlocState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GenresBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<MusicGenre> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<MusicGenre> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<MusicGenre> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorGenresBlocState value) error,
    required TResult Function(LoadingGenresBlocState value) loading,
    required TResult Function(LoadedGenresBlocState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresBlocState value)? error,
    TResult? Function(LoadingGenresBlocState value)? loading,
    TResult? Function(LoadedGenresBlocState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresBlocState value)? error,
    TResult Function(LoadingGenresBlocState value)? loading,
    TResult Function(LoadedGenresBlocState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresBlocStateCopyWith<$Res> {
  factory $GenresBlocStateCopyWith(
          GenresBlocState value, $Res Function(GenresBlocState) then) =
      _$GenresBlocStateCopyWithImpl<$Res, GenresBlocState>;
}

/// @nodoc
class _$GenresBlocStateCopyWithImpl<$Res, $Val extends GenresBlocState>
    implements $GenresBlocStateCopyWith<$Res> {
  _$GenresBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorGenresBlocStateCopyWith<$Res> {
  factory _$$ErrorGenresBlocStateCopyWith(_$ErrorGenresBlocState value,
          $Res Function(_$ErrorGenresBlocState) then) =
      __$$ErrorGenresBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorGenresBlocStateCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$ErrorGenresBlocState>
    implements _$$ErrorGenresBlocStateCopyWith<$Res> {
  __$$ErrorGenresBlocStateCopyWithImpl(_$ErrorGenresBlocState _value,
      $Res Function(_$ErrorGenresBlocState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorGenresBlocState implements ErrorGenresBlocState {
  const _$ErrorGenresBlocState({final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorGenresBlocState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorGenresBlocStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenresBlocState.error()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<MusicGenre> data) loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<MusicGenre> data)? loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<MusicGenre> data)? loaded,
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
    required TResult Function(ErrorGenresBlocState value) error,
    required TResult Function(LoadingGenresBlocState value) loading,
    required TResult Function(LoadedGenresBlocState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresBlocState value)? error,
    TResult? Function(LoadingGenresBlocState value)? loading,
    TResult? Function(LoadedGenresBlocState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresBlocState value)? error,
    TResult Function(LoadingGenresBlocState value)? loading,
    TResult Function(LoadedGenresBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorGenresBlocStateToJson(
      this,
    );
  }
}

abstract class ErrorGenresBlocState implements GenresBlocState {
  const factory ErrorGenresBlocState() = _$ErrorGenresBlocState;

  factory ErrorGenresBlocState.fromJson(Map<String, dynamic> json) =
      _$ErrorGenresBlocState.fromJson;
}

/// @nodoc
abstract class _$$LoadingGenresBlocStateCopyWith<$Res> {
  factory _$$LoadingGenresBlocStateCopyWith(_$LoadingGenresBlocState value,
          $Res Function(_$LoadingGenresBlocState) then) =
      __$$LoadingGenresBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGenresBlocStateCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$LoadingGenresBlocState>
    implements _$$LoadingGenresBlocStateCopyWith<$Res> {
  __$$LoadingGenresBlocStateCopyWithImpl(_$LoadingGenresBlocState _value,
      $Res Function(_$LoadingGenresBlocState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingGenresBlocState implements LoadingGenresBlocState {
  const _$LoadingGenresBlocState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingGenresBlocState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingGenresBlocStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenresBlocState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<MusicGenre> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<MusicGenre> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<MusicGenre> data)? loaded,
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
    required TResult Function(ErrorGenresBlocState value) error,
    required TResult Function(LoadingGenresBlocState value) loading,
    required TResult Function(LoadedGenresBlocState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresBlocState value)? error,
    TResult? Function(LoadingGenresBlocState value)? loading,
    TResult? Function(LoadedGenresBlocState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresBlocState value)? error,
    TResult Function(LoadingGenresBlocState value)? loading,
    TResult Function(LoadedGenresBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingGenresBlocStateToJson(
      this,
    );
  }
}

abstract class LoadingGenresBlocState implements GenresBlocState {
  const factory LoadingGenresBlocState() = _$LoadingGenresBlocState;

  factory LoadingGenresBlocState.fromJson(Map<String, dynamic> json) =
      _$LoadingGenresBlocState.fromJson;
}

/// @nodoc
abstract class _$$LoadedGenresBlocStateCopyWith<$Res> {
  factory _$$LoadedGenresBlocStateCopyWith(_$LoadedGenresBlocState value,
          $Res Function(_$LoadedGenresBlocState) then) =
      __$$LoadedGenresBlocStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MusicGenre> data});
}

/// @nodoc
class __$$LoadedGenresBlocStateCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$LoadedGenresBlocState>
    implements _$$LoadedGenresBlocStateCopyWith<$Res> {
  __$$LoadedGenresBlocStateCopyWithImpl(_$LoadedGenresBlocState _value,
      $Res Function(_$LoadedGenresBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedGenresBlocState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MusicGenre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedGenresBlocState implements LoadedGenresBlocState {
  const _$LoadedGenresBlocState(
      {required final List<MusicGenre> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedGenresBlocState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedGenresBlocStateFromJson(json);

  final List<MusicGenre> _data;
  @override
  List<MusicGenre> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenresBlocState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedGenresBlocStateCopyWith<_$LoadedGenresBlocState> get copyWith =>
      __$$LoadedGenresBlocStateCopyWithImpl<_$LoadedGenresBlocState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<MusicGenre> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<MusicGenre> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<MusicGenre> data)? loaded,
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
    required TResult Function(ErrorGenresBlocState value) error,
    required TResult Function(LoadingGenresBlocState value) loading,
    required TResult Function(LoadedGenresBlocState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresBlocState value)? error,
    TResult? Function(LoadingGenresBlocState value)? loading,
    TResult? Function(LoadedGenresBlocState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresBlocState value)? error,
    TResult Function(LoadingGenresBlocState value)? loading,
    TResult Function(LoadedGenresBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedGenresBlocStateToJson(
      this,
    );
  }
}

abstract class LoadedGenresBlocState implements GenresBlocState {
  const factory LoadedGenresBlocState({required final List<MusicGenre> data}) =
      _$LoadedGenresBlocState;

  factory LoadedGenresBlocState.fromJson(Map<String, dynamic> json) =
      _$LoadedGenresBlocState.fromJson;

  List<MusicGenre> get data;
  @JsonKey(ignore: true)
  _$$LoadedGenresBlocStateCopyWith<_$LoadedGenresBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
