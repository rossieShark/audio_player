// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_searched_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentlySearchedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRecentlySearchedState value) loading,
    required TResult Function(EmptyRecentlySearchedState value) empty,
    required TResult Function(LoadedRecentlySearchedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRecentlySearchedState value)? loading,
    TResult? Function(EmptyRecentlySearchedState value)? empty,
    TResult? Function(LoadedRecentlySearchedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRecentlySearchedState value)? loading,
    TResult Function(EmptyRecentlySearchedState value)? empty,
    TResult Function(LoadedRecentlySearchedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlySearchedStateCopyWith<$Res> {
  factory $RecentlySearchedStateCopyWith(RecentlySearchedState value,
          $Res Function(RecentlySearchedState) then) =
      _$RecentlySearchedStateCopyWithImpl<$Res, RecentlySearchedState>;
}

/// @nodoc
class _$RecentlySearchedStateCopyWithImpl<$Res,
        $Val extends RecentlySearchedState>
    implements $RecentlySearchedStateCopyWith<$Res> {
  _$RecentlySearchedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingRecentlySearchedStateCopyWith<$Res> {
  factory _$$LoadingRecentlySearchedStateCopyWith(
          _$LoadingRecentlySearchedState value,
          $Res Function(_$LoadingRecentlySearchedState) then) =
      __$$LoadingRecentlySearchedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRecentlySearchedStateCopyWithImpl<$Res>
    extends _$RecentlySearchedStateCopyWithImpl<$Res,
        _$LoadingRecentlySearchedState>
    implements _$$LoadingRecentlySearchedStateCopyWith<$Res> {
  __$$LoadingRecentlySearchedStateCopyWithImpl(
      _$LoadingRecentlySearchedState _value,
      $Res Function(_$LoadingRecentlySearchedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingRecentlySearchedState implements LoadingRecentlySearchedState {
  const _$LoadingRecentlySearchedState();

  @override
  String toString() {
    return 'RecentlySearchedState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingRecentlySearchedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> data)? loaded,
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
    required TResult Function(LoadingRecentlySearchedState value) loading,
    required TResult Function(EmptyRecentlySearchedState value) empty,
    required TResult Function(LoadedRecentlySearchedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRecentlySearchedState value)? loading,
    TResult? Function(EmptyRecentlySearchedState value)? empty,
    TResult? Function(LoadedRecentlySearchedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRecentlySearchedState value)? loading,
    TResult Function(EmptyRecentlySearchedState value)? empty,
    TResult Function(LoadedRecentlySearchedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingRecentlySearchedState implements RecentlySearchedState {
  const factory LoadingRecentlySearchedState() = _$LoadingRecentlySearchedState;
}

/// @nodoc
abstract class _$$EmptyRecentlySearchedStateCopyWith<$Res> {
  factory _$$EmptyRecentlySearchedStateCopyWith(
          _$EmptyRecentlySearchedState value,
          $Res Function(_$EmptyRecentlySearchedState) then) =
      __$$EmptyRecentlySearchedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyRecentlySearchedStateCopyWithImpl<$Res>
    extends _$RecentlySearchedStateCopyWithImpl<$Res,
        _$EmptyRecentlySearchedState>
    implements _$$EmptyRecentlySearchedStateCopyWith<$Res> {
  __$$EmptyRecentlySearchedStateCopyWithImpl(
      _$EmptyRecentlySearchedState _value,
      $Res Function(_$EmptyRecentlySearchedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyRecentlySearchedState implements EmptyRecentlySearchedState {
  const _$EmptyRecentlySearchedState();

  @override
  String toString() {
    return 'RecentlySearchedState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyRecentlySearchedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> data)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingRecentlySearchedState value) loading,
    required TResult Function(EmptyRecentlySearchedState value) empty,
    required TResult Function(LoadedRecentlySearchedState value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRecentlySearchedState value)? loading,
    TResult? Function(EmptyRecentlySearchedState value)? empty,
    TResult? Function(LoadedRecentlySearchedState value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRecentlySearchedState value)? loading,
    TResult Function(EmptyRecentlySearchedState value)? empty,
    TResult Function(LoadedRecentlySearchedState value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyRecentlySearchedState implements RecentlySearchedState {
  const factory EmptyRecentlySearchedState() = _$EmptyRecentlySearchedState;
}

/// @nodoc
abstract class _$$LoadedRecentlySearchedStateCopyWith<$Res> {
  factory _$$LoadedRecentlySearchedStateCopyWith(
          _$LoadedRecentlySearchedState value,
          $Res Function(_$LoadedRecentlySearchedState) then) =
      __$$LoadedRecentlySearchedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongModel> data});
}

/// @nodoc
class __$$LoadedRecentlySearchedStateCopyWithImpl<$Res>
    extends _$RecentlySearchedStateCopyWithImpl<$Res,
        _$LoadedRecentlySearchedState>
    implements _$$LoadedRecentlySearchedStateCopyWith<$Res> {
  __$$LoadedRecentlySearchedStateCopyWithImpl(
      _$LoadedRecentlySearchedState _value,
      $Res Function(_$LoadedRecentlySearchedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedRecentlySearchedState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class _$LoadedRecentlySearchedState implements LoadedRecentlySearchedState {
  const _$LoadedRecentlySearchedState({required final List<SongModel> data})
      : _data = data;

  final List<SongModel> _data;
  @override
  List<SongModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecentlySearchedState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedRecentlySearchedState &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedRecentlySearchedStateCopyWith<_$LoadedRecentlySearchedState>
      get copyWith => __$$LoadedRecentlySearchedStateCopyWithImpl<
          _$LoadedRecentlySearchedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<SongModel> data)? loaded,
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
    required TResult Function(LoadingRecentlySearchedState value) loading,
    required TResult Function(EmptyRecentlySearchedState value) empty,
    required TResult Function(LoadedRecentlySearchedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingRecentlySearchedState value)? loading,
    TResult? Function(EmptyRecentlySearchedState value)? empty,
    TResult? Function(LoadedRecentlySearchedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingRecentlySearchedState value)? loading,
    TResult Function(EmptyRecentlySearchedState value)? empty,
    TResult Function(LoadedRecentlySearchedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedRecentlySearchedState implements RecentlySearchedState {
  const factory LoadedRecentlySearchedState(
      {required final List<SongModel> data}) = _$LoadedRecentlySearchedState;

  List<SongModel> get data;
  @JsonKey(ignore: true)
  _$$LoadedRecentlySearchedStateCopyWith<_$LoadedRecentlySearchedState>
      get copyWith => throw _privateConstructorUsedError;
}
