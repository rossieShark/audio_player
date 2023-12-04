// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlbumBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<BestAlbum> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<BestAlbum> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<BestAlbum> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorAlbumBlocState value) error,
    required TResult Function(LoadingAlbumBlocState value) loading,
    required TResult Function(LoadedAlbumBlocState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumBlocState value)? error,
    TResult? Function(LoadingAlbumBlocState value)? loading,
    TResult? Function(LoadedAlbumBlocState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumBlocState value)? error,
    TResult Function(LoadingAlbumBlocState value)? loading,
    TResult Function(LoadedAlbumBlocState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumBlocStateCopyWith<$Res> {
  factory $AlbumBlocStateCopyWith(
          AlbumBlocState value, $Res Function(AlbumBlocState) then) =
      _$AlbumBlocStateCopyWithImpl<$Res, AlbumBlocState>;
}

/// @nodoc
class _$AlbumBlocStateCopyWithImpl<$Res, $Val extends AlbumBlocState>
    implements $AlbumBlocStateCopyWith<$Res> {
  _$AlbumBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorAlbumBlocStateCopyWith<$Res> {
  factory _$$ErrorAlbumBlocStateCopyWith(_$ErrorAlbumBlocState value,
          $Res Function(_$ErrorAlbumBlocState) then) =
      __$$ErrorAlbumBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorAlbumBlocStateCopyWithImpl<$Res>
    extends _$AlbumBlocStateCopyWithImpl<$Res, _$ErrorAlbumBlocState>
    implements _$$ErrorAlbumBlocStateCopyWith<$Res> {
  __$$ErrorAlbumBlocStateCopyWithImpl(
      _$ErrorAlbumBlocState _value, $Res Function(_$ErrorAlbumBlocState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorAlbumBlocState implements ErrorAlbumBlocState {
  const _$ErrorAlbumBlocState();

  @override
  String toString() {
    return 'AlbumBlocState.error()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<BestAlbum> data) loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<BestAlbum> data)? loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<BestAlbum> data)? loaded,
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
    required TResult Function(ErrorAlbumBlocState value) error,
    required TResult Function(LoadingAlbumBlocState value) loading,
    required TResult Function(LoadedAlbumBlocState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumBlocState value)? error,
    TResult? Function(LoadingAlbumBlocState value)? loading,
    TResult? Function(LoadedAlbumBlocState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumBlocState value)? error,
    TResult Function(LoadingAlbumBlocState value)? loading,
    TResult Function(LoadedAlbumBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorAlbumBlocState implements AlbumBlocState {
  const factory ErrorAlbumBlocState() = _$ErrorAlbumBlocState;
}

/// @nodoc
abstract class _$$LoadingAlbumBlocStateCopyWith<$Res> {
  factory _$$LoadingAlbumBlocStateCopyWith(_$LoadingAlbumBlocState value,
          $Res Function(_$LoadingAlbumBlocState) then) =
      __$$LoadingAlbumBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAlbumBlocStateCopyWithImpl<$Res>
    extends _$AlbumBlocStateCopyWithImpl<$Res, _$LoadingAlbumBlocState>
    implements _$$LoadingAlbumBlocStateCopyWith<$Res> {
  __$$LoadingAlbumBlocStateCopyWithImpl(_$LoadingAlbumBlocState _value,
      $Res Function(_$LoadingAlbumBlocState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingAlbumBlocState implements LoadingAlbumBlocState {
  const _$LoadingAlbumBlocState();

  @override
  String toString() {
    return 'AlbumBlocState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<BestAlbum> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<BestAlbum> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<BestAlbum> data)? loaded,
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
    required TResult Function(ErrorAlbumBlocState value) error,
    required TResult Function(LoadingAlbumBlocState value) loading,
    required TResult Function(LoadedAlbumBlocState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumBlocState value)? error,
    TResult? Function(LoadingAlbumBlocState value)? loading,
    TResult? Function(LoadedAlbumBlocState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumBlocState value)? error,
    TResult Function(LoadingAlbumBlocState value)? loading,
    TResult Function(LoadedAlbumBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingAlbumBlocState implements AlbumBlocState {
  const factory LoadingAlbumBlocState() = _$LoadingAlbumBlocState;
}

/// @nodoc
abstract class _$$LoadedAlbumBlocStateCopyWith<$Res> {
  factory _$$LoadedAlbumBlocStateCopyWith(_$LoadedAlbumBlocState value,
          $Res Function(_$LoadedAlbumBlocState) then) =
      __$$LoadedAlbumBlocStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BestAlbum> data});
}

/// @nodoc
class __$$LoadedAlbumBlocStateCopyWithImpl<$Res>
    extends _$AlbumBlocStateCopyWithImpl<$Res, _$LoadedAlbumBlocState>
    implements _$$LoadedAlbumBlocStateCopyWith<$Res> {
  __$$LoadedAlbumBlocStateCopyWithImpl(_$LoadedAlbumBlocState _value,
      $Res Function(_$LoadedAlbumBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedAlbumBlocState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BestAlbum>,
    ));
  }
}

/// @nodoc

class _$LoadedAlbumBlocState implements LoadedAlbumBlocState {
  const _$LoadedAlbumBlocState({required final List<BestAlbum> data})
      : _data = data;

  final List<BestAlbum> _data;
  @override
  List<BestAlbum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AlbumBlocState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedAlbumBlocStateCopyWith<_$LoadedAlbumBlocState> get copyWith =>
      __$$LoadedAlbumBlocStateCopyWithImpl<_$LoadedAlbumBlocState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<BestAlbum> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<BestAlbum> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<BestAlbum> data)? loaded,
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
    required TResult Function(ErrorAlbumBlocState value) error,
    required TResult Function(LoadingAlbumBlocState value) loading,
    required TResult Function(LoadedAlbumBlocState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumBlocState value)? error,
    TResult? Function(LoadingAlbumBlocState value)? loading,
    TResult? Function(LoadedAlbumBlocState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumBlocState value)? error,
    TResult Function(LoadingAlbumBlocState value)? loading,
    TResult Function(LoadedAlbumBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedAlbumBlocState implements AlbumBlocState {
  const factory LoadedAlbumBlocState({required final List<BestAlbum> data}) =
      _$LoadedAlbumBlocState;

  List<BestAlbum> get data;
  @JsonKey(ignore: true)
  _$$LoadedAlbumBlocStateCopyWith<_$LoadedAlbumBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
