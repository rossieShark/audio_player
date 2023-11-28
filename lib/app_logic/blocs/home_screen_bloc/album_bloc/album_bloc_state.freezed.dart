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

AlbumState _$AlbumStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'error':
      return ErrorAlbumState.fromJson(json);
    case 'loading':
      return LoadingAlbumState.fromJson(json);
    case 'loaded':
      return LoadedAlbumState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AlbumState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AlbumState {
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
    required TResult Function(ErrorAlbumState value) error,
    required TResult Function(LoadingAlbumState value) loading,
    required TResult Function(LoadedAlbumState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumState value)? error,
    TResult? Function(LoadingAlbumState value)? loading,
    TResult? Function(LoadedAlbumState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumState value)? error,
    TResult Function(LoadingAlbumState value)? loading,
    TResult Function(LoadedAlbumState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumStateCopyWith<$Res> {
  factory $AlbumStateCopyWith(
          AlbumState value, $Res Function(AlbumState) then) =
      _$AlbumStateCopyWithImpl<$Res, AlbumState>;
}

/// @nodoc
class _$AlbumStateCopyWithImpl<$Res, $Val extends AlbumState>
    implements $AlbumStateCopyWith<$Res> {
  _$AlbumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorAlbumStateCopyWith<$Res> {
  factory _$$ErrorAlbumStateCopyWith(
          _$ErrorAlbumState value, $Res Function(_$ErrorAlbumState) then) =
      __$$ErrorAlbumStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorAlbumStateCopyWithImpl<$Res>
    extends _$AlbumStateCopyWithImpl<$Res, _$ErrorAlbumState>
    implements _$$ErrorAlbumStateCopyWith<$Res> {
  __$$ErrorAlbumStateCopyWithImpl(
      _$ErrorAlbumState _value, $Res Function(_$ErrorAlbumState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ErrorAlbumState implements ErrorAlbumState {
  const _$ErrorAlbumState({final String? $type}) : $type = $type ?? 'error';

  factory _$ErrorAlbumState.fromJson(Map<String, dynamic> json) =>
      _$$ErrorAlbumStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AlbumState.error()';
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
    required TResult Function(ErrorAlbumState value) error,
    required TResult Function(LoadingAlbumState value) loading,
    required TResult Function(LoadedAlbumState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumState value)? error,
    TResult? Function(LoadingAlbumState value)? loading,
    TResult? Function(LoadedAlbumState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumState value)? error,
    TResult Function(LoadingAlbumState value)? loading,
    TResult Function(LoadedAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorAlbumStateToJson(
      this,
    );
  }
}

abstract class ErrorAlbumState implements AlbumState {
  const factory ErrorAlbumState() = _$ErrorAlbumState;

  factory ErrorAlbumState.fromJson(Map<String, dynamic> json) =
      _$ErrorAlbumState.fromJson;
}

/// @nodoc
abstract class _$$LoadingAlbumStateCopyWith<$Res> {
  factory _$$LoadingAlbumStateCopyWith(
          _$LoadingAlbumState value, $Res Function(_$LoadingAlbumState) then) =
      __$$LoadingAlbumStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAlbumStateCopyWithImpl<$Res>
    extends _$AlbumStateCopyWithImpl<$Res, _$LoadingAlbumState>
    implements _$$LoadingAlbumStateCopyWith<$Res> {
  __$$LoadingAlbumStateCopyWithImpl(
      _$LoadingAlbumState _value, $Res Function(_$LoadingAlbumState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$LoadingAlbumState implements LoadingAlbumState {
  const _$LoadingAlbumState({final String? $type}) : $type = $type ?? 'loading';

  factory _$LoadingAlbumState.fromJson(Map<String, dynamic> json) =>
      _$$LoadingAlbumStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AlbumState.loading()';
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
    required TResult Function(ErrorAlbumState value) error,
    required TResult Function(LoadingAlbumState value) loading,
    required TResult Function(LoadedAlbumState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumState value)? error,
    TResult? Function(LoadingAlbumState value)? loading,
    TResult? Function(LoadedAlbumState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumState value)? error,
    TResult Function(LoadingAlbumState value)? loading,
    TResult Function(LoadedAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingAlbumStateToJson(
      this,
    );
  }
}

abstract class LoadingAlbumState implements AlbumState {
  const factory LoadingAlbumState() = _$LoadingAlbumState;

  factory LoadingAlbumState.fromJson(Map<String, dynamic> json) =
      _$LoadingAlbumState.fromJson;
}

/// @nodoc
abstract class _$$LoadedAlbumStateCopyWith<$Res> {
  factory _$$LoadedAlbumStateCopyWith(
          _$LoadedAlbumState value, $Res Function(_$LoadedAlbumState) then) =
      __$$LoadedAlbumStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BestAlbum> data});
}

/// @nodoc
class __$$LoadedAlbumStateCopyWithImpl<$Res>
    extends _$AlbumStateCopyWithImpl<$Res, _$LoadedAlbumState>
    implements _$$LoadedAlbumStateCopyWith<$Res> {
  __$$LoadedAlbumStateCopyWithImpl(
      _$LoadedAlbumState _value, $Res Function(_$LoadedAlbumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedAlbumState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BestAlbum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadedAlbumState implements LoadedAlbumState {
  const _$LoadedAlbumState(
      {required final List<BestAlbum> data, final String? $type})
      : _data = data,
        $type = $type ?? 'loaded';

  factory _$LoadedAlbumState.fromJson(Map<String, dynamic> json) =>
      _$$LoadedAlbumStateFromJson(json);

  final List<BestAlbum> _data;
  @override
  List<BestAlbum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AlbumState.loaded(data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedAlbumStateCopyWith<_$LoadedAlbumState> get copyWith =>
      __$$LoadedAlbumStateCopyWithImpl<_$LoadedAlbumState>(this, _$identity);

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
    required TResult Function(ErrorAlbumState value) error,
    required TResult Function(LoadingAlbumState value) loading,
    required TResult Function(LoadedAlbumState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorAlbumState value)? error,
    TResult? Function(LoadingAlbumState value)? loading,
    TResult? Function(LoadedAlbumState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorAlbumState value)? error,
    TResult Function(LoadingAlbumState value)? loading,
    TResult Function(LoadedAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadedAlbumStateToJson(
      this,
    );
  }
}

abstract class LoadedAlbumState implements AlbumState {
  const factory LoadedAlbumState({required final List<BestAlbum> data}) =
      _$LoadedAlbumState;

  factory LoadedAlbumState.fromJson(Map<String, dynamic> json) =
      _$LoadedAlbumState.fromJson;

  List<BestAlbum> get data;
  @JsonKey(ignore: true)
  _$$LoadedAlbumStateCopyWith<_$LoadedAlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}
