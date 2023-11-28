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

GenresState _$GenresStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorGenresState.fromJson(json);
    case 'loading':
      return LoadingGenresState.fromJson(json);
    case 'loaded':
      return LoadedGenresState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GenresState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GenresState {
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
    required TResult Function(ErrorGenresState value) error,
    required TResult Function(LoadingGenresState value) loading,
    required TResult Function(LoadedGenresState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresState value)? error,
    TResult? Function(LoadingGenresState value)? loading,
    TResult? Function(LoadedGenresState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresState value)? error,
    TResult Function(LoadingGenresState value)? loading,
    TResult Function(LoadedGenresState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenresStateCopyWith<$Res> {
  factory $GenresStateCopyWith(
          GenresState value, $Res Function(GenresState) then) =
      _$GenresStateCopyWithImpl<$Res, GenresState>;
}

/// @nodoc
class _$GenresStateCopyWithImpl<$Res, $Val extends GenresState>
    implements $GenresStateCopyWith<$Res> {
  _$GenresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorGenresStateCopyWith<$Res> {
  factory _$$ErrorGenresStateCopyWith(
          _$ErrorGenresState value, $Res Function(_$ErrorGenresState) then) =
      __$$ErrorGenresStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorGenresStateCopyWithImpl<$Res>
    extends _$GenresStateCopyWithImpl<$Res, _$ErrorGenresState>
    implements _$$ErrorGenresStateCopyWith<$Res> {
  __$$ErrorGenresStateCopyWithImpl(
      _$ErrorGenresState _value, $Res Function(_$ErrorGenresState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorGenresState implements ErrorGenresState {
  const _$ErrorGenresState({final String? $type}) : $type = $type ?? 'error';

  factory _$ErrorGenresState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorGenresStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenresState.error()';
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
    required TResult Function(ErrorGenresState value) error,
    required TResult Function(LoadingGenresState value) loading,
    required TResult Function(LoadedGenresState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresState value)? error,
    TResult? Function(LoadingGenresState value)? loading,
    TResult? Function(LoadedGenresState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresState value)? error,
    TResult Function(LoadingGenresState value)? loading,
    TResult Function(LoadedGenresState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorGenresStateToJson(
      this,
    );
  }
}

abstract class ErrorGenresState implements GenresState {
  const factory ErrorGenresState() = _$ErrorGenresState;

  factory ErrorGenresState.fromJson(Map<String, dynamic> json) =
      _$ErrorGenresState.fromJson;
}

/// @nodoc
abstract class _$$LoadingGenresStateCopyWith<$Res> {
  factory _$$LoadingGenresStateCopyWith(_$LoadingGenresState value,
          $Res Function(_$LoadingGenresState) then) =
      __$$LoadingGenresStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGenresStateCopyWithImpl<$Res>
    extends _$GenresStateCopyWithImpl<$Res, _$LoadingGenresState>
    implements _$$LoadingGenresStateCopyWith<$Res> {
  __$$LoadingGenresStateCopyWithImpl(
      _$LoadingGenresState _value, $Res Function(_$LoadingGenresState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingGenresState implements LoadingGenresState {
  const _$LoadingGenresState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingGenresState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingGenresStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenresState.loading()';
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
    required TResult Function(ErrorGenresState value) error,
    required TResult Function(LoadingGenresState value) loading,
    required TResult Function(LoadedGenresState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresState value)? error,
    TResult? Function(LoadingGenresState value)? loading,
    TResult? Function(LoadedGenresState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresState value)? error,
    TResult Function(LoadingGenresState value)? loading,
    TResult Function(LoadedGenresState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingGenresStateToJson(
      this,
    );
  }
}

abstract class LoadingGenresState implements GenresState {
  const factory LoadingGenresState() = _$LoadingGenresState;

  factory LoadingGenresState.fromJson(Map<String, dynamic> json) =
      _$LoadingGenresState.fromJson;
}

/// @nodoc
abstract class _$$LoadedGenresStateCopyWith<$Res> {
  factory _$$LoadedGenresStateCopyWith(
          _$LoadedGenresState value, $Res Function(_$LoadedGenresState) then) =
      __$$LoadedGenresStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MusicGenre> data});
}

/// @nodoc
class __$$LoadedGenresStateCopyWithImpl<$Res>
    extends _$GenresStateCopyWithImpl<$Res, _$LoadedGenresState>
    implements _$$LoadedGenresStateCopyWith<$Res> {
  __$$LoadedGenresStateCopyWithImpl(
      _$LoadedGenresState _value, $Res Function(_$LoadedGenresState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedGenresState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MusicGenre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedGenresState implements LoadedGenresState {
  const _$LoadedGenresState(
      {required final List<MusicGenre> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedGenresState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedGenresStateFromJson(json);

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
    return 'GenresState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedGenresStateCopyWith<_$LoadedGenresState> get copyWith =>
      __$$LoadedGenresStateCopyWithImpl<_$LoadedGenresState>(this, _$identity);

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
    required TResult Function(ErrorGenresState value) error,
    required TResult Function(LoadingGenresState value) loading,
    required TResult Function(LoadedGenresState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorGenresState value)? error,
    TResult? Function(LoadingGenresState value)? loading,
    TResult? Function(LoadedGenresState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorGenresState value)? error,
    TResult Function(LoadingGenresState value)? loading,
    TResult Function(LoadedGenresState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedGenresStateToJson(
      this,
    );
  }
}

abstract class LoadedGenresState implements GenresState {
  const factory LoadedGenresState({required final List<MusicGenre> data}) =
      _$LoadedGenresState;

  factory LoadedGenresState.fromJson(Map<String, dynamic> json) =
      _$LoadedGenresState.fromJson;

  List<MusicGenre> get data;
  @JsonKey(ignore: true)
  _$$LoadedGenresStateCopyWith<_$LoadedGenresState> get copyWith =>
      throw _privateConstructorUsedError;
}
