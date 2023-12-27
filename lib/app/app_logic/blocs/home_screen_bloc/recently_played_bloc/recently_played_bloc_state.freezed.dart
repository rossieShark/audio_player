// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentlyPlayedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<RecentlyPlayedSong> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<RecentlyPlayedSong> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<RecentlyPlayedSong> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorRecentlyPlayedState value) error,
    required TResult Function(LoadingRecentlyPlayedState value) loading,
    required TResult Function(LoadedRecentlyPlayedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedState value)? error,
    TResult? Function(LoadingRecentlyPlayedState value)? loading,
    TResult? Function(LoadedRecentlyPlayedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedState value)? error,
    TResult Function(LoadingRecentlyPlayedState value)? loading,
    TResult Function(LoadedRecentlyPlayedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedStateCopyWith<$Res> {
  factory $RecentlyPlayedStateCopyWith(
          RecentlyPlayedState value, $Res Function(RecentlyPlayedState) then) =
      _$RecentlyPlayedStateCopyWithImpl<$Res, RecentlyPlayedState>;
}

/// @nodoc
class _$RecentlyPlayedStateCopyWithImpl<$Res, $Val extends RecentlyPlayedState>
    implements $RecentlyPlayedStateCopyWith<$Res> {
  _$RecentlyPlayedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorRecentlyPlayedStateImplCopyWith<$Res> {
  factory _$$ErrorRecentlyPlayedStateImplCopyWith(
          _$ErrorRecentlyPlayedStateImpl value,
          $Res Function(_$ErrorRecentlyPlayedStateImpl) then) =
      __$$ErrorRecentlyPlayedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorRecentlyPlayedStateImplCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res,
        _$ErrorRecentlyPlayedStateImpl>
    implements _$$ErrorRecentlyPlayedStateImplCopyWith<$Res> {
  __$$ErrorRecentlyPlayedStateImplCopyWithImpl(
      _$ErrorRecentlyPlayedStateImpl _value,
      $Res Function(_$ErrorRecentlyPlayedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorRecentlyPlayedStateImpl implements ErrorRecentlyPlayedState {
  const _$ErrorRecentlyPlayedStateImpl();

  @override
  String toString() {
    return 'RecentlyPlayedState.error()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<RecentlyPlayedSong> data) loaded,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<RecentlyPlayedSong> data)? loaded,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<RecentlyPlayedSong> data)? loaded,
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
    required TResult Function(ErrorRecentlyPlayedState value) error,
    required TResult Function(LoadingRecentlyPlayedState value) loading,
    required TResult Function(LoadedRecentlyPlayedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedState value)? error,
    TResult? Function(LoadingRecentlyPlayedState value)? loading,
    TResult? Function(LoadedRecentlyPlayedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedState value)? error,
    TResult Function(LoadingRecentlyPlayedState value)? loading,
    TResult Function(LoadedRecentlyPlayedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorRecentlyPlayedState implements RecentlyPlayedState {
  const factory ErrorRecentlyPlayedState() = _$ErrorRecentlyPlayedStateImpl;
}

/// @nodoc
abstract class _$$LoadingRecentlyPlayedStateImplCopyWith<$Res> {
  factory _$$LoadingRecentlyPlayedStateImplCopyWith(
          _$LoadingRecentlyPlayedStateImpl value,
          $Res Function(_$LoadingRecentlyPlayedStateImpl) then) =
      __$$LoadingRecentlyPlayedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRecentlyPlayedStateImplCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res,
        _$LoadingRecentlyPlayedStateImpl>
    implements _$$LoadingRecentlyPlayedStateImplCopyWith<$Res> {
  __$$LoadingRecentlyPlayedStateImplCopyWithImpl(
      _$LoadingRecentlyPlayedStateImpl _value,
      $Res Function(_$LoadingRecentlyPlayedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingRecentlyPlayedStateImpl implements LoadingRecentlyPlayedState {
  const _$LoadingRecentlyPlayedStateImpl();

  @override
  String toString() {
    return 'RecentlyPlayedState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<RecentlyPlayedSong> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<RecentlyPlayedSong> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<RecentlyPlayedSong> data)? loaded,
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
    required TResult Function(ErrorRecentlyPlayedState value) error,
    required TResult Function(LoadingRecentlyPlayedState value) loading,
    required TResult Function(LoadedRecentlyPlayedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedState value)? error,
    TResult? Function(LoadingRecentlyPlayedState value)? loading,
    TResult? Function(LoadedRecentlyPlayedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedState value)? error,
    TResult Function(LoadingRecentlyPlayedState value)? loading,
    TResult Function(LoadedRecentlyPlayedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingRecentlyPlayedState implements RecentlyPlayedState {
  const factory LoadingRecentlyPlayedState() = _$LoadingRecentlyPlayedStateImpl;
}

/// @nodoc
abstract class _$$LoadedRecentlyPlayedStateImplCopyWith<$Res> {
  factory _$$LoadedRecentlyPlayedStateImplCopyWith(
          _$LoadedRecentlyPlayedStateImpl value,
          $Res Function(_$LoadedRecentlyPlayedStateImpl) then) =
      __$$LoadedRecentlyPlayedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecentlyPlayedSong> data});
}

/// @nodoc
class __$$LoadedRecentlyPlayedStateImplCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res,
        _$LoadedRecentlyPlayedStateImpl>
    implements _$$LoadedRecentlyPlayedStateImplCopyWith<$Res> {
  __$$LoadedRecentlyPlayedStateImplCopyWithImpl(
      _$LoadedRecentlyPlayedStateImpl _value,
      $Res Function(_$LoadedRecentlyPlayedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedRecentlyPlayedStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedSong>,
    ));
  }
}

/// @nodoc

class _$LoadedRecentlyPlayedStateImpl implements LoadedRecentlyPlayedState {
  const _$LoadedRecentlyPlayedStateImpl(
      {required final List<RecentlyPlayedSong> data})
      : _data = data;

  final List<RecentlyPlayedSong> _data;
  @override
  List<RecentlyPlayedSong> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecentlyPlayedState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedRecentlyPlayedStateImplCopyWith<_$LoadedRecentlyPlayedStateImpl>
      get copyWith => __$$LoadedRecentlyPlayedStateImplCopyWithImpl<
          _$LoadedRecentlyPlayedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function(List<RecentlyPlayedSong> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function(List<RecentlyPlayedSong> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function(List<RecentlyPlayedSong> data)? loaded,
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
    required TResult Function(ErrorRecentlyPlayedState value) error,
    required TResult Function(LoadingRecentlyPlayedState value) loading,
    required TResult Function(LoadedRecentlyPlayedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedState value)? error,
    TResult? Function(LoadingRecentlyPlayedState value)? loading,
    TResult? Function(LoadedRecentlyPlayedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedState value)? error,
    TResult Function(LoadingRecentlyPlayedState value)? loading,
    TResult Function(LoadedRecentlyPlayedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedRecentlyPlayedState implements RecentlyPlayedState {
  const factory LoadedRecentlyPlayedState(
          {required final List<RecentlyPlayedSong> data}) =
      _$LoadedRecentlyPlayedStateImpl;

  List<RecentlyPlayedSong> get data;
  @JsonKey(ignore: true)
  _$$LoadedRecentlyPlayedStateImplCopyWith<_$LoadedRecentlyPlayedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
