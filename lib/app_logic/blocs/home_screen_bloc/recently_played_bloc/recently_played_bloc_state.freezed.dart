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

RecentlyPlayedState _$RecentlyPlayedStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorRecentlyPlayedState.fromJson(json);
    case 'loading':
      return LoadingRecentlyPlayedState.fromJson(json);
    case 'loaded':
      return LoadedRecentlyPlayedState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RecentlyPlayedState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
abstract class _$$ErrorRecentlyPlayedStateCopyWith<$Res> {
  factory _$$ErrorRecentlyPlayedStateCopyWith(_$ErrorRecentlyPlayedState value,
          $Res Function(_$ErrorRecentlyPlayedState) then) =
      __$$ErrorRecentlyPlayedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorRecentlyPlayedStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res, _$ErrorRecentlyPlayedState>
    implements _$$ErrorRecentlyPlayedStateCopyWith<$Res> {
  __$$ErrorRecentlyPlayedStateCopyWithImpl(_$ErrorRecentlyPlayedState _value,
      $Res Function(_$ErrorRecentlyPlayedState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorRecentlyPlayedState implements ErrorRecentlyPlayedState {
  const _$ErrorRecentlyPlayedState({final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorRecentlyPlayedState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorRecentlyPlayedStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

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

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorRecentlyPlayedStateToJson(
      this,
    );
  }
}

abstract class ErrorRecentlyPlayedState implements RecentlyPlayedState {
  const factory ErrorRecentlyPlayedState() = _$ErrorRecentlyPlayedState;

  factory ErrorRecentlyPlayedState.fromJson(Map<String, dynamic> json) =
      _$ErrorRecentlyPlayedState.fromJson;
}

/// @nodoc
abstract class _$$LoadingRecentlyPlayedStateCopyWith<$Res> {
  factory _$$LoadingRecentlyPlayedStateCopyWith(
          _$LoadingRecentlyPlayedState value,
          $Res Function(_$LoadingRecentlyPlayedState) then) =
      __$$LoadingRecentlyPlayedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRecentlyPlayedStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res,
        _$LoadingRecentlyPlayedState>
    implements _$$LoadingRecentlyPlayedStateCopyWith<$Res> {
  __$$LoadingRecentlyPlayedStateCopyWithImpl(
      _$LoadingRecentlyPlayedState _value,
      $Res Function(_$LoadingRecentlyPlayedState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingRecentlyPlayedState implements LoadingRecentlyPlayedState {
  const _$LoadingRecentlyPlayedState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingRecentlyPlayedState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingRecentlyPlayedStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

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

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingRecentlyPlayedStateToJson(
      this,
    );
  }
}

abstract class LoadingRecentlyPlayedState implements RecentlyPlayedState {
  const factory LoadingRecentlyPlayedState() = _$LoadingRecentlyPlayedState;

  factory LoadingRecentlyPlayedState.fromJson(Map<String, dynamic> json) =
      _$LoadingRecentlyPlayedState.fromJson;
}

/// @nodoc
abstract class _$$LoadedRecentlyPlayedStateCopyWith<$Res> {
  factory _$$LoadedRecentlyPlayedStateCopyWith(
          _$LoadedRecentlyPlayedState value,
          $Res Function(_$LoadedRecentlyPlayedState) then) =
      __$$LoadedRecentlyPlayedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecentlyPlayedSong> data});
}

/// @nodoc
class __$$LoadedRecentlyPlayedStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedStateCopyWithImpl<$Res, _$LoadedRecentlyPlayedState>
    implements _$$LoadedRecentlyPlayedStateCopyWith<$Res> {
  __$$LoadedRecentlyPlayedStateCopyWithImpl(_$LoadedRecentlyPlayedState _value,
      $Res Function(_$LoadedRecentlyPlayedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedRecentlyPlayedState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedSong>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedRecentlyPlayedState implements LoadedRecentlyPlayedState {
  const _$LoadedRecentlyPlayedState(
      {required final List<RecentlyPlayedSong> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedRecentlyPlayedState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedRecentlyPlayedStateFromJson(json);

  final List<RecentlyPlayedSong> _data;
  @override
  List<RecentlyPlayedSong> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecentlyPlayedState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedRecentlyPlayedStateCopyWith<_$LoadedRecentlyPlayedState>
      get copyWith => __$$LoadedRecentlyPlayedStateCopyWithImpl<
          _$LoadedRecentlyPlayedState>(this, _$identity);

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

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedRecentlyPlayedStateToJson(
      this,
    );
  }
}

abstract class LoadedRecentlyPlayedState implements RecentlyPlayedState {
  const factory LoadedRecentlyPlayedState(
          {required final List<RecentlyPlayedSong> data}) =
      _$LoadedRecentlyPlayedState;

  factory LoadedRecentlyPlayedState.fromJson(Map<String, dynamic> json) =
      _$LoadedRecentlyPlayedState.fromJson;

  List<RecentlyPlayedSong> get data;
  @JsonKey(ignore: true)
  _$$LoadedRecentlyPlayedStateCopyWith<_$LoadedRecentlyPlayedState>
      get copyWith => throw _privateConstructorUsedError;
}
