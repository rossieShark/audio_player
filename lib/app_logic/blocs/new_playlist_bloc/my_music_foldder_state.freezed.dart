// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_music_foldder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPlaylistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<FavoriteFolder> folders) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<FavoriteFolder> folders)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<FavoriteFolder> folders)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyNewPlaylistState value) empty,
    required TResult Function(LoadedNewPlaylistState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyNewPlaylistState value)? empty,
    TResult? Function(LoadedNewPlaylistState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyNewPlaylistState value)? empty,
    TResult Function(LoadedNewPlaylistState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPlaylistStateCopyWith<$Res> {
  factory $NewPlaylistStateCopyWith(
          NewPlaylistState value, $Res Function(NewPlaylistState) then) =
      _$NewPlaylistStateCopyWithImpl<$Res, NewPlaylistState>;
}

/// @nodoc
class _$NewPlaylistStateCopyWithImpl<$Res, $Val extends NewPlaylistState>
    implements $NewPlaylistStateCopyWith<$Res> {
  _$NewPlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyNewPlaylistStateImplCopyWith<$Res> {
  factory _$$EmptyNewPlaylistStateImplCopyWith(
          _$EmptyNewPlaylistStateImpl value,
          $Res Function(_$EmptyNewPlaylistStateImpl) then) =
      __$$EmptyNewPlaylistStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyNewPlaylistStateImplCopyWithImpl<$Res>
    extends _$NewPlaylistStateCopyWithImpl<$Res, _$EmptyNewPlaylistStateImpl>
    implements _$$EmptyNewPlaylistStateImplCopyWith<$Res> {
  __$$EmptyNewPlaylistStateImplCopyWithImpl(_$EmptyNewPlaylistStateImpl _value,
      $Res Function(_$EmptyNewPlaylistStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyNewPlaylistStateImpl implements EmptyNewPlaylistState {
  const _$EmptyNewPlaylistStateImpl();

  @override
  String toString() {
    return 'NewPlaylistState.empty()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<FavoriteFolder> folders) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<FavoriteFolder> folders)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<FavoriteFolder> folders)? loaded,
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
    required TResult Function(EmptyNewPlaylistState value) empty,
    required TResult Function(LoadedNewPlaylistState value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyNewPlaylistState value)? empty,
    TResult? Function(LoadedNewPlaylistState value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyNewPlaylistState value)? empty,
    TResult Function(LoadedNewPlaylistState value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyNewPlaylistState implements NewPlaylistState {
  const factory EmptyNewPlaylistState() = _$EmptyNewPlaylistStateImpl;
}

/// @nodoc
abstract class _$$LoadedNewPlaylistStateImplCopyWith<$Res> {
  factory _$$LoadedNewPlaylistStateImplCopyWith(
          _$LoadedNewPlaylistStateImpl value,
          $Res Function(_$LoadedNewPlaylistStateImpl) then) =
      __$$LoadedNewPlaylistStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteFolder> folders});
}

/// @nodoc
class __$$LoadedNewPlaylistStateImplCopyWithImpl<$Res>
    extends _$NewPlaylistStateCopyWithImpl<$Res, _$LoadedNewPlaylistStateImpl>
    implements _$$LoadedNewPlaylistStateImplCopyWith<$Res> {
  __$$LoadedNewPlaylistStateImplCopyWithImpl(
      _$LoadedNewPlaylistStateImpl _value,
      $Res Function(_$LoadedNewPlaylistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folders = null,
  }) {
    return _then(_$LoadedNewPlaylistStateImpl(
      folders: null == folders
          ? _value._folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<FavoriteFolder>,
    ));
  }
}

/// @nodoc

class _$LoadedNewPlaylistStateImpl implements LoadedNewPlaylistState {
  const _$LoadedNewPlaylistStateImpl(
      {required final List<FavoriteFolder> folders})
      : _folders = folders;

  final List<FavoriteFolder> _folders;
  @override
  List<FavoriteFolder> get folders {
    if (_folders is EqualUnmodifiableListView) return _folders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folders);
  }

  @override
  String toString() {
    return 'NewPlaylistState.loaded(folders: $folders)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedNewPlaylistStateImplCopyWith<_$LoadedNewPlaylistStateImpl>
      get copyWith => __$$LoadedNewPlaylistStateImplCopyWithImpl<
          _$LoadedNewPlaylistStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<FavoriteFolder> folders) loaded,
  }) {
    return loaded(folders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<FavoriteFolder> folders)? loaded,
  }) {
    return loaded?.call(folders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<FavoriteFolder> folders)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(folders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyNewPlaylistState value) empty,
    required TResult Function(LoadedNewPlaylistState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyNewPlaylistState value)? empty,
    TResult? Function(LoadedNewPlaylistState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyNewPlaylistState value)? empty,
    TResult Function(LoadedNewPlaylistState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedNewPlaylistState implements NewPlaylistState {
  const factory LoadedNewPlaylistState(
          {required final List<FavoriteFolder> folders}) =
      _$LoadedNewPlaylistStateImpl;

  List<FavoriteFolder> get folders;
  @JsonKey(ignore: true)
  _$$LoadedNewPlaylistStateImplCopyWith<_$LoadedNewPlaylistStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
