// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_played_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentlyPlayedBlocState _$RecentlyPlayedBlocStateFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorRecentlyPlayedBlocState.fromJson(json);
    case 'loading':
      return LoadingRecentlyPlayedBlocState.fromJson(json);
    case 'loaded':
      return LoadedRecentlyPlayedBlocState.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'RecentlyPlayedBlocState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RecentlyPlayedBlocState {
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
    required TResult Function(ErrorRecentlyPlayedBlocState value) error,
    required TResult Function(LoadingRecentlyPlayedBlocState value) loading,
    required TResult Function(LoadedRecentlyPlayedBlocState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult? Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult? Function(LoadedRecentlyPlayedBlocState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult Function(LoadedRecentlyPlayedBlocState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentlyPlayedBlocStateCopyWith<$Res> {
  factory $RecentlyPlayedBlocStateCopyWith(RecentlyPlayedBlocState value,
          $Res Function(RecentlyPlayedBlocState) then) =
      _$RecentlyPlayedBlocStateCopyWithImpl<$Res, RecentlyPlayedBlocState>;
}

/// @nodoc
class _$RecentlyPlayedBlocStateCopyWithImpl<$Res,
        $Val extends RecentlyPlayedBlocState>
    implements $RecentlyPlayedBlocStateCopyWith<$Res> {
  _$RecentlyPlayedBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorRecentlyPlayedBlocStateCopyWith<$Res> {
  factory _$$ErrorRecentlyPlayedBlocStateCopyWith(
          _$ErrorRecentlyPlayedBlocState value,
          $Res Function(_$ErrorRecentlyPlayedBlocState) then) =
      __$$ErrorRecentlyPlayedBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorRecentlyPlayedBlocStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedBlocStateCopyWithImpl<$Res,
        _$ErrorRecentlyPlayedBlocState>
    implements _$$ErrorRecentlyPlayedBlocStateCopyWith<$Res> {
  __$$ErrorRecentlyPlayedBlocStateCopyWithImpl(
      _$ErrorRecentlyPlayedBlocState _value,
      $Res Function(_$ErrorRecentlyPlayedBlocState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorRecentlyPlayedBlocState implements ErrorRecentlyPlayedBlocState {
  const _$ErrorRecentlyPlayedBlocState({final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorRecentlyPlayedBlocState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorRecentlyPlayedBlocStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecentlyPlayedBlocState.error()';
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
    required TResult Function(ErrorRecentlyPlayedBlocState value) error,
    required TResult Function(LoadingRecentlyPlayedBlocState value) loading,
    required TResult Function(LoadedRecentlyPlayedBlocState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult? Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult? Function(LoadedRecentlyPlayedBlocState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult Function(LoadedRecentlyPlayedBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorRecentlyPlayedBlocStateToJson(
      this,
    );
  }
}

abstract class ErrorRecentlyPlayedBlocState implements RecentlyPlayedBlocState {
  const factory ErrorRecentlyPlayedBlocState() = _$ErrorRecentlyPlayedBlocState;

  factory ErrorRecentlyPlayedBlocState.fromJson(Map<String, dynamic> json) =
      _$ErrorRecentlyPlayedBlocState.fromJson;
}

/// @nodoc
abstract class _$$LoadingRecentlyPlayedBlocStateCopyWith<$Res> {
  factory _$$LoadingRecentlyPlayedBlocStateCopyWith(
          _$LoadingRecentlyPlayedBlocState value,
          $Res Function(_$LoadingRecentlyPlayedBlocState) then) =
      __$$LoadingRecentlyPlayedBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingRecentlyPlayedBlocStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedBlocStateCopyWithImpl<$Res,
        _$LoadingRecentlyPlayedBlocState>
    implements _$$LoadingRecentlyPlayedBlocStateCopyWith<$Res> {
  __$$LoadingRecentlyPlayedBlocStateCopyWithImpl(
      _$LoadingRecentlyPlayedBlocState _value,
      $Res Function(_$LoadingRecentlyPlayedBlocState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingRecentlyPlayedBlocState
    implements LoadingRecentlyPlayedBlocState {
  const _$LoadingRecentlyPlayedBlocState({final String? $type})
      : $type = $type ?? 'loading';

  factory _$LoadingRecentlyPlayedBlocState.fromJson(
          Map<String, dynamic> json) =>
      _$$LoadingRecentlyPlayedBlocStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecentlyPlayedBlocState.loading()';
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
    required TResult Function(ErrorRecentlyPlayedBlocState value) error,
    required TResult Function(LoadingRecentlyPlayedBlocState value) loading,
    required TResult Function(LoadedRecentlyPlayedBlocState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult? Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult? Function(LoadedRecentlyPlayedBlocState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult Function(LoadedRecentlyPlayedBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingRecentlyPlayedBlocStateToJson(
      this,
    );
  }
}

abstract class LoadingRecentlyPlayedBlocState
    implements RecentlyPlayedBlocState {
  const factory LoadingRecentlyPlayedBlocState() =
      _$LoadingRecentlyPlayedBlocState;

  factory LoadingRecentlyPlayedBlocState.fromJson(Map<String, dynamic> json) =
      _$LoadingRecentlyPlayedBlocState.fromJson;
}

/// @nodoc
abstract class _$$LoadedRecentlyPlayedBlocStateCopyWith<$Res> {
  factory _$$LoadedRecentlyPlayedBlocStateCopyWith(
          _$LoadedRecentlyPlayedBlocState value,
          $Res Function(_$LoadedRecentlyPlayedBlocState) then) =
      __$$LoadedRecentlyPlayedBlocStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RecentlyPlayedSong> data});
}

/// @nodoc
class __$$LoadedRecentlyPlayedBlocStateCopyWithImpl<$Res>
    extends _$RecentlyPlayedBlocStateCopyWithImpl<$Res,
        _$LoadedRecentlyPlayedBlocState>
    implements _$$LoadedRecentlyPlayedBlocStateCopyWith<$Res> {
  __$$LoadedRecentlyPlayedBlocStateCopyWithImpl(
      _$LoadedRecentlyPlayedBlocState _value,
      $Res Function(_$LoadedRecentlyPlayedBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedRecentlyPlayedBlocState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecentlyPlayedSong>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedRecentlyPlayedBlocState implements LoadedRecentlyPlayedBlocState {
  const _$LoadedRecentlyPlayedBlocState(
      {required final List<RecentlyPlayedSong> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedRecentlyPlayedBlocState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedRecentlyPlayedBlocStateFromJson(json);

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
    return 'RecentlyPlayedBlocState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedRecentlyPlayedBlocStateCopyWith<_$LoadedRecentlyPlayedBlocState>
      get copyWith => __$$LoadedRecentlyPlayedBlocStateCopyWithImpl<
          _$LoadedRecentlyPlayedBlocState>(this, _$identity);

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
    required TResult Function(ErrorRecentlyPlayedBlocState value) error,
    required TResult Function(LoadingRecentlyPlayedBlocState value) loading,
    required TResult Function(LoadedRecentlyPlayedBlocState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult? Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult? Function(LoadedRecentlyPlayedBlocState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorRecentlyPlayedBlocState value)? error,
    TResult Function(LoadingRecentlyPlayedBlocState value)? loading,
    TResult Function(LoadedRecentlyPlayedBlocState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedRecentlyPlayedBlocStateToJson(
      this,
    );
  }
}

abstract class LoadedRecentlyPlayedBlocState
    implements RecentlyPlayedBlocState {
  const factory LoadedRecentlyPlayedBlocState(
          {required final List<RecentlyPlayedSong> data}) =
      _$LoadedRecentlyPlayedBlocState;

  factory LoadedRecentlyPlayedBlocState.fromJson(Map<String, dynamic> json) =
      _$LoadedRecentlyPlayedBlocState.fromJson;

  List<RecentlyPlayedSong> get data;
  @JsonKey(ignore: true)
  _$$LoadedRecentlyPlayedBlocStateCopyWith<_$LoadedRecentlyPlayedBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
