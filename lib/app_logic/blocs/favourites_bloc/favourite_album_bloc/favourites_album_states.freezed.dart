// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_album_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteAlbumState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SongModel> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SongModel> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SongModel> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingFavoriteAlbumState value) loading,
    required TResult Function(NoResultsFavoriteAlbumState value) noResults,
    required TResult Function(LoadedFavoriteAlbumState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingFavoriteAlbumState value)? loading,
    TResult? Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult? Function(LoadedFavoriteAlbumState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingFavoriteAlbumState value)? loading,
    TResult Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult Function(LoadedFavoriteAlbumState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteAlbumStateCopyWith<$Res> {
  factory $FavoriteAlbumStateCopyWith(
          FavoriteAlbumState value, $Res Function(FavoriteAlbumState) then) =
      _$FavoriteAlbumStateCopyWithImpl<$Res, FavoriteAlbumState>;
}

/// @nodoc
class _$FavoriteAlbumStateCopyWithImpl<$Res, $Val extends FavoriteAlbumState>
    implements $FavoriteAlbumStateCopyWith<$Res> {
  _$FavoriteAlbumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingFavoriteAlbumStateCopyWith<$Res> {
  factory _$$LoadingFavoriteAlbumStateCopyWith(
          _$LoadingFavoriteAlbumState value,
          $Res Function(_$LoadingFavoriteAlbumState) then) =
      __$$LoadingFavoriteAlbumStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingFavoriteAlbumStateCopyWithImpl<$Res>
    extends _$FavoriteAlbumStateCopyWithImpl<$Res, _$LoadingFavoriteAlbumState>
    implements _$$LoadingFavoriteAlbumStateCopyWith<$Res> {
  __$$LoadingFavoriteAlbumStateCopyWithImpl(_$LoadingFavoriteAlbumState _value,
      $Res Function(_$LoadingFavoriteAlbumState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingFavoriteAlbumState implements LoadingFavoriteAlbumState {
  const _$LoadingFavoriteAlbumState();

  @override
  String toString() {
    return 'FavoriteAlbumState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingFavoriteAlbumState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
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
    required TResult Function(LoadingFavoriteAlbumState value) loading,
    required TResult Function(NoResultsFavoriteAlbumState value) noResults,
    required TResult Function(LoadedFavoriteAlbumState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingFavoriteAlbumState value)? loading,
    TResult? Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult? Function(LoadedFavoriteAlbumState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingFavoriteAlbumState value)? loading,
    TResult Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult Function(LoadedFavoriteAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingFavoriteAlbumState implements FavoriteAlbumState {
  const factory LoadingFavoriteAlbumState() = _$LoadingFavoriteAlbumState;
}

/// @nodoc
abstract class _$$NoResultsFavoriteAlbumStateCopyWith<$Res> {
  factory _$$NoResultsFavoriteAlbumStateCopyWith(
          _$NoResultsFavoriteAlbumState value,
          $Res Function(_$NoResultsFavoriteAlbumState) then) =
      __$$NoResultsFavoriteAlbumStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoResultsFavoriteAlbumStateCopyWithImpl<$Res>
    extends _$FavoriteAlbumStateCopyWithImpl<$Res,
        _$NoResultsFavoriteAlbumState>
    implements _$$NoResultsFavoriteAlbumStateCopyWith<$Res> {
  __$$NoResultsFavoriteAlbumStateCopyWithImpl(
      _$NoResultsFavoriteAlbumState _value,
      $Res Function(_$NoResultsFavoriteAlbumState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoResultsFavoriteAlbumState implements NoResultsFavoriteAlbumState {
  const _$NoResultsFavoriteAlbumState();

  @override
  String toString() {
    return 'FavoriteAlbumState.noResults()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoResultsFavoriteAlbumState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return noResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return noResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<SongModel> data)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingFavoriteAlbumState value) loading,
    required TResult Function(NoResultsFavoriteAlbumState value) noResults,
    required TResult Function(LoadedFavoriteAlbumState value) loaded,
  }) {
    return noResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingFavoriteAlbumState value)? loading,
    TResult? Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult? Function(LoadedFavoriteAlbumState value)? loaded,
  }) {
    return noResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingFavoriteAlbumState value)? loading,
    TResult Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult Function(LoadedFavoriteAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults(this);
    }
    return orElse();
  }
}

abstract class NoResultsFavoriteAlbumState implements FavoriteAlbumState {
  const factory NoResultsFavoriteAlbumState() = _$NoResultsFavoriteAlbumState;
}

/// @nodoc
abstract class _$$LoadedFavoriteAlbumStateCopyWith<$Res> {
  factory _$$LoadedFavoriteAlbumStateCopyWith(_$LoadedFavoriteAlbumState value,
          $Res Function(_$LoadedFavoriteAlbumState) then) =
      __$$LoadedFavoriteAlbumStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SongModel> data});
}

/// @nodoc
class __$$LoadedFavoriteAlbumStateCopyWithImpl<$Res>
    extends _$FavoriteAlbumStateCopyWithImpl<$Res, _$LoadedFavoriteAlbumState>
    implements _$$LoadedFavoriteAlbumStateCopyWith<$Res> {
  __$$LoadedFavoriteAlbumStateCopyWithImpl(_$LoadedFavoriteAlbumState _value,
      $Res Function(_$LoadedFavoriteAlbumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedFavoriteAlbumState(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
    ));
  }
}

/// @nodoc

class _$LoadedFavoriteAlbumState implements LoadedFavoriteAlbumState {
  const _$LoadedFavoriteAlbumState({required final List<SongModel> data})
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
    return 'FavoriteAlbumState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedFavoriteAlbumState &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedFavoriteAlbumStateCopyWith<_$LoadedFavoriteAlbumState>
      get copyWith =>
          __$$LoadedFavoriteAlbumStateCopyWithImpl<_$LoadedFavoriteAlbumState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<SongModel> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<SongModel> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
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
    required TResult Function(LoadingFavoriteAlbumState value) loading,
    required TResult Function(NoResultsFavoriteAlbumState value) noResults,
    required TResult Function(LoadedFavoriteAlbumState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingFavoriteAlbumState value)? loading,
    TResult? Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult? Function(LoadedFavoriteAlbumState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingFavoriteAlbumState value)? loading,
    TResult Function(NoResultsFavoriteAlbumState value)? noResults,
    TResult Function(LoadedFavoriteAlbumState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedFavoriteAlbumState implements FavoriteAlbumState {
  const factory LoadedFavoriteAlbumState(
      {required final List<SongModel> data}) = _$LoadedFavoriteAlbumState;

  List<SongModel> get data;
  @JsonKey(ignore: true)
  _$$LoadedFavoriteAlbumStateCopyWith<_$LoadedFavoriteAlbumState>
      get copyWith => throw _privateConstructorUsedError;
}
