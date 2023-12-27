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
abstract class _$$ErrorGenresBlocStateImplCopyWith<$Res> {
  factory _$$ErrorGenresBlocStateImplCopyWith(_$ErrorGenresBlocStateImpl value,
          $Res Function(_$ErrorGenresBlocStateImpl) then) =
      __$$ErrorGenresBlocStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorGenresBlocStateImplCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$ErrorGenresBlocStateImpl>
    implements _$$ErrorGenresBlocStateImplCopyWith<$Res> {
  __$$ErrorGenresBlocStateImplCopyWithImpl(_$ErrorGenresBlocStateImpl _value,
      $Res Function(_$ErrorGenresBlocStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorGenresBlocStateImpl implements ErrorGenresBlocState {
  const _$ErrorGenresBlocStateImpl();

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
}

abstract class ErrorGenresBlocState implements GenresBlocState {
  const factory ErrorGenresBlocState() = _$ErrorGenresBlocStateImpl;
}

/// @nodoc
abstract class _$$LoadingGenresBlocStateImplCopyWith<$Res> {
  factory _$$LoadingGenresBlocStateImplCopyWith(
          _$LoadingGenresBlocStateImpl value,
          $Res Function(_$LoadingGenresBlocStateImpl) then) =
      __$$LoadingGenresBlocStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGenresBlocStateImplCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$LoadingGenresBlocStateImpl>
    implements _$$LoadingGenresBlocStateImplCopyWith<$Res> {
  __$$LoadingGenresBlocStateImplCopyWithImpl(
      _$LoadingGenresBlocStateImpl _value,
      $Res Function(_$LoadingGenresBlocStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGenresBlocStateImpl implements LoadingGenresBlocState {
  const _$LoadingGenresBlocStateImpl();

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
}

abstract class LoadingGenresBlocState implements GenresBlocState {
  const factory LoadingGenresBlocState() = _$LoadingGenresBlocStateImpl;
}

/// @nodoc
abstract class _$$LoadedGenresBlocStateImplCopyWith<$Res> {
  factory _$$LoadedGenresBlocStateImplCopyWith(
          _$LoadedGenresBlocStateImpl value,
          $Res Function(_$LoadedGenresBlocStateImpl) then) =
      __$$LoadedGenresBlocStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MusicGenre> data});
}

/// @nodoc
class __$$LoadedGenresBlocStateImplCopyWithImpl<$Res>
    extends _$GenresBlocStateCopyWithImpl<$Res, _$LoadedGenresBlocStateImpl>
    implements _$$LoadedGenresBlocStateImplCopyWith<$Res> {
  __$$LoadedGenresBlocStateImplCopyWithImpl(_$LoadedGenresBlocStateImpl _value,
      $Res Function(_$LoadedGenresBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedGenresBlocStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MusicGenre>,
    ));
  }
}

/// @nodoc

class _$LoadedGenresBlocStateImpl implements LoadedGenresBlocState {
  const _$LoadedGenresBlocStateImpl({required final List<MusicGenre> data})
      : _data = data;

  final List<MusicGenre> _data;
  @override
  List<MusicGenre> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GenresBlocState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedGenresBlocStateImplCopyWith<_$LoadedGenresBlocStateImpl>
      get copyWith => __$$LoadedGenresBlocStateImplCopyWithImpl<
          _$LoadedGenresBlocStateImpl>(this, _$identity);

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
}

abstract class LoadedGenresBlocState implements GenresBlocState {
  const factory LoadedGenresBlocState({required final List<MusicGenre> data}) =
      _$LoadedGenresBlocStateImpl;

  List<MusicGenre> get data;
  @JsonKey(ignore: true)
  _$$LoadedGenresBlocStateImplCopyWith<_$LoadedGenresBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
