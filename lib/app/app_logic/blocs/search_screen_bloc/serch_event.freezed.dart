// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serch_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchEvent _$SearchEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'textChanged':
      return TextChangedSearchEvent.fromJson(json);
    case 'loadSearchResults':
      return LoadSearchEvent.fromJson(json);
    case 'loadMoreItems':
      return LoadMoreItemsSearchEvent.fromJson(json);
    case 'filterFetchResult':
      return FilterFetchResultSearchEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SearchEvent',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SearchEvent {
  String get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText, String filter) textChanged,
    required TResult Function(String newText, String filter) loadSearchResults,
    required TResult Function(String text, String filter) loadMoreItems,
    required TResult Function(String text, String filter) filterFetchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText, String filter)? textChanged,
    TResult? Function(String newText, String filter)? loadSearchResults,
    TResult? Function(String text, String filter)? loadMoreItems,
    TResult? Function(String text, String filter)? filterFetchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText, String filter)? textChanged,
    TResult Function(String newText, String filter)? loadSearchResults,
    TResult Function(String text, String filter)? loadMoreItems,
    TResult Function(String text, String filter)? filterFetchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
    required TResult Function(FilterFetchResultSearchEvent value)
        filterFetchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult? Function(FilterFetchResultSearchEvent value)? filterFetchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult Function(FilterFetchResultSearchEvent value)? filterFetchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
  @useResult
  $Res call({String filter});
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextChangedSearchEventImplCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$TextChangedSearchEventImplCopyWith(
          _$TextChangedSearchEventImpl value,
          $Res Function(_$TextChangedSearchEventImpl) then) =
      __$$TextChangedSearchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newText, String filter});
}

/// @nodoc
class __$$TextChangedSearchEventImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$TextChangedSearchEventImpl>
    implements _$$TextChangedSearchEventImplCopyWith<$Res> {
  __$$TextChangedSearchEventImplCopyWithImpl(
      _$TextChangedSearchEventImpl _value,
      $Res Function(_$TextChangedSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
    Object? filter = null,
  }) {
    return _then(_$TextChangedSearchEventImpl(
      newText: null == newText
          ? _value.newText
          : newText // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextChangedSearchEventImpl implements TextChangedSearchEvent {
  const _$TextChangedSearchEventImpl(
      {required this.newText, required this.filter, final String? $type})
      : $type = $type ?? 'textChanged';

  factory _$TextChangedSearchEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextChangedSearchEventImplFromJson(json);

  @override
  final String newText;
  @override
  final String filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.textChanged(newText: $newText, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextChangedSearchEventImpl &&
            (identical(other.newText, newText) || other.newText == newText) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextChangedSearchEventImplCopyWith<_$TextChangedSearchEventImpl>
      get copyWith => __$$TextChangedSearchEventImplCopyWithImpl<
          _$TextChangedSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText, String filter) textChanged,
    required TResult Function(String newText, String filter) loadSearchResults,
    required TResult Function(String text, String filter) loadMoreItems,
    required TResult Function(String text, String filter) filterFetchResult,
  }) {
    return textChanged(newText, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText, String filter)? textChanged,
    TResult? Function(String newText, String filter)? loadSearchResults,
    TResult? Function(String text, String filter)? loadMoreItems,
    TResult? Function(String text, String filter)? filterFetchResult,
  }) {
    return textChanged?.call(newText, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText, String filter)? textChanged,
    TResult Function(String newText, String filter)? loadSearchResults,
    TResult Function(String text, String filter)? loadMoreItems,
    TResult Function(String text, String filter)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(newText, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
    required TResult Function(FilterFetchResultSearchEvent value)
        filterFetchResult,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult? Function(FilterFetchResultSearchEvent value)? filterFetchResult,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult Function(FilterFetchResultSearchEvent value)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextChangedSearchEventImplToJson(
      this,
    );
  }
}

abstract class TextChangedSearchEvent implements SearchEvent {
  const factory TextChangedSearchEvent(
      {required final String newText,
      required final String filter}) = _$TextChangedSearchEventImpl;

  factory TextChangedSearchEvent.fromJson(Map<String, dynamic> json) =
      _$TextChangedSearchEventImpl.fromJson;

  String get newText;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$TextChangedSearchEventImplCopyWith<_$TextChangedSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSearchEventImplCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$LoadSearchEventImplCopyWith(_$LoadSearchEventImpl value,
          $Res Function(_$LoadSearchEventImpl) then) =
      __$$LoadSearchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newText, String filter});
}

/// @nodoc
class __$$LoadSearchEventImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadSearchEventImpl>
    implements _$$LoadSearchEventImplCopyWith<$Res> {
  __$$LoadSearchEventImplCopyWithImpl(
      _$LoadSearchEventImpl _value, $Res Function(_$LoadSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
    Object? filter = null,
  }) {
    return _then(_$LoadSearchEventImpl(
      newText: null == newText
          ? _value.newText
          : newText // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadSearchEventImpl implements LoadSearchEvent {
  const _$LoadSearchEventImpl(
      {required this.newText, required this.filter, final String? $type})
      : $type = $type ?? 'loadSearchResults';

  factory _$LoadSearchEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadSearchEventImplFromJson(json);

  @override
  final String newText;
  @override
  final String filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.loadSearchResults(newText: $newText, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSearchEventImpl &&
            (identical(other.newText, newText) || other.newText == newText) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSearchEventImplCopyWith<_$LoadSearchEventImpl> get copyWith =>
      __$$LoadSearchEventImplCopyWithImpl<_$LoadSearchEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText, String filter) textChanged,
    required TResult Function(String newText, String filter) loadSearchResults,
    required TResult Function(String text, String filter) loadMoreItems,
    required TResult Function(String text, String filter) filterFetchResult,
  }) {
    return loadSearchResults(newText, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText, String filter)? textChanged,
    TResult? Function(String newText, String filter)? loadSearchResults,
    TResult? Function(String text, String filter)? loadMoreItems,
    TResult? Function(String text, String filter)? filterFetchResult,
  }) {
    return loadSearchResults?.call(newText, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText, String filter)? textChanged,
    TResult Function(String newText, String filter)? loadSearchResults,
    TResult Function(String text, String filter)? loadMoreItems,
    TResult Function(String text, String filter)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (loadSearchResults != null) {
      return loadSearchResults(newText, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
    required TResult Function(FilterFetchResultSearchEvent value)
        filterFetchResult,
  }) {
    return loadSearchResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult? Function(FilterFetchResultSearchEvent value)? filterFetchResult,
  }) {
    return loadSearchResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult Function(FilterFetchResultSearchEvent value)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (loadSearchResults != null) {
      return loadSearchResults(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadSearchEventImplToJson(
      this,
    );
  }
}

abstract class LoadSearchEvent implements SearchEvent {
  const factory LoadSearchEvent(
      {required final String newText,
      required final String filter}) = _$LoadSearchEventImpl;

  factory LoadSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadSearchEventImpl.fromJson;

  String get newText;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadSearchEventImplCopyWith<_$LoadSearchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreItemsSearchEventImplCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$LoadMoreItemsSearchEventImplCopyWith(
          _$LoadMoreItemsSearchEventImpl value,
          $Res Function(_$LoadMoreItemsSearchEventImpl) then) =
      __$$LoadMoreItemsSearchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String filter});
}

/// @nodoc
class __$$LoadMoreItemsSearchEventImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadMoreItemsSearchEventImpl>
    implements _$$LoadMoreItemsSearchEventImplCopyWith<$Res> {
  __$$LoadMoreItemsSearchEventImplCopyWithImpl(
      _$LoadMoreItemsSearchEventImpl _value,
      $Res Function(_$LoadMoreItemsSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? filter = null,
  }) {
    return _then(_$LoadMoreItemsSearchEventImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadMoreItemsSearchEventImpl implements LoadMoreItemsSearchEvent {
  const _$LoadMoreItemsSearchEventImpl(
      {required this.text, required this.filter, final String? $type})
      : $type = $type ?? 'loadMoreItems';

  factory _$LoadMoreItemsSearchEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadMoreItemsSearchEventImplFromJson(json);

  @override
  final String text;
  @override
  final String filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.loadMoreItems(text: $text, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreItemsSearchEventImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreItemsSearchEventImplCopyWith<_$LoadMoreItemsSearchEventImpl>
      get copyWith => __$$LoadMoreItemsSearchEventImplCopyWithImpl<
          _$LoadMoreItemsSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText, String filter) textChanged,
    required TResult Function(String newText, String filter) loadSearchResults,
    required TResult Function(String text, String filter) loadMoreItems,
    required TResult Function(String text, String filter) filterFetchResult,
  }) {
    return loadMoreItems(text, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText, String filter)? textChanged,
    TResult? Function(String newText, String filter)? loadSearchResults,
    TResult? Function(String text, String filter)? loadMoreItems,
    TResult? Function(String text, String filter)? filterFetchResult,
  }) {
    return loadMoreItems?.call(text, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText, String filter)? textChanged,
    TResult Function(String newText, String filter)? loadSearchResults,
    TResult Function(String text, String filter)? loadMoreItems,
    TResult Function(String text, String filter)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (loadMoreItems != null) {
      return loadMoreItems(text, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
    required TResult Function(FilterFetchResultSearchEvent value)
        filterFetchResult,
  }) {
    return loadMoreItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult? Function(FilterFetchResultSearchEvent value)? filterFetchResult,
  }) {
    return loadMoreItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult Function(FilterFetchResultSearchEvent value)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (loadMoreItems != null) {
      return loadMoreItems(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadMoreItemsSearchEventImplToJson(
      this,
    );
  }
}

abstract class LoadMoreItemsSearchEvent implements SearchEvent {
  const factory LoadMoreItemsSearchEvent(
      {required final String text,
      required final String filter}) = _$LoadMoreItemsSearchEventImpl;

  factory LoadMoreItemsSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadMoreItemsSearchEventImpl.fromJson;

  String get text;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadMoreItemsSearchEventImplCopyWith<_$LoadMoreItemsSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterFetchResultSearchEventImplCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$FilterFetchResultSearchEventImplCopyWith(
          _$FilterFetchResultSearchEventImpl value,
          $Res Function(_$FilterFetchResultSearchEventImpl) then) =
      __$$FilterFetchResultSearchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String filter});
}

/// @nodoc
class __$$FilterFetchResultSearchEventImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$FilterFetchResultSearchEventImpl>
    implements _$$FilterFetchResultSearchEventImplCopyWith<$Res> {
  __$$FilterFetchResultSearchEventImplCopyWithImpl(
      _$FilterFetchResultSearchEventImpl _value,
      $Res Function(_$FilterFetchResultSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? filter = null,
  }) {
    return _then(_$FilterFetchResultSearchEventImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterFetchResultSearchEventImpl
    implements FilterFetchResultSearchEvent {
  const _$FilterFetchResultSearchEventImpl(
      {required this.text, required this.filter, final String? $type})
      : $type = $type ?? 'filterFetchResult';

  factory _$FilterFetchResultSearchEventImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FilterFetchResultSearchEventImplFromJson(json);

  @override
  final String text;
  @override
  final String filter;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SearchEvent.filterFetchResult(text: $text, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterFetchResultSearchEventImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterFetchResultSearchEventImplCopyWith<
          _$FilterFetchResultSearchEventImpl>
      get copyWith => __$$FilterFetchResultSearchEventImplCopyWithImpl<
          _$FilterFetchResultSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String newText, String filter) textChanged,
    required TResult Function(String newText, String filter) loadSearchResults,
    required TResult Function(String text, String filter) loadMoreItems,
    required TResult Function(String text, String filter) filterFetchResult,
  }) {
    return filterFetchResult(text, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String newText, String filter)? textChanged,
    TResult? Function(String newText, String filter)? loadSearchResults,
    TResult? Function(String text, String filter)? loadMoreItems,
    TResult? Function(String text, String filter)? filterFetchResult,
  }) {
    return filterFetchResult?.call(text, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String newText, String filter)? textChanged,
    TResult Function(String newText, String filter)? loadSearchResults,
    TResult Function(String text, String filter)? loadMoreItems,
    TResult Function(String text, String filter)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (filterFetchResult != null) {
      return filterFetchResult(text, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextChangedSearchEvent value) textChanged,
    required TResult Function(LoadSearchEvent value) loadSearchResults,
    required TResult Function(LoadMoreItemsSearchEvent value) loadMoreItems,
    required TResult Function(FilterFetchResultSearchEvent value)
        filterFetchResult,
  }) {
    return filterFetchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextChangedSearchEvent value)? textChanged,
    TResult? Function(LoadSearchEvent value)? loadSearchResults,
    TResult? Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult? Function(FilterFetchResultSearchEvent value)? filterFetchResult,
  }) {
    return filterFetchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextChangedSearchEvent value)? textChanged,
    TResult Function(LoadSearchEvent value)? loadSearchResults,
    TResult Function(LoadMoreItemsSearchEvent value)? loadMoreItems,
    TResult Function(FilterFetchResultSearchEvent value)? filterFetchResult,
    required TResult orElse(),
  }) {
    if (filterFetchResult != null) {
      return filterFetchResult(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterFetchResultSearchEventImplToJson(
      this,
    );
  }
}

abstract class FilterFetchResultSearchEvent implements SearchEvent {
  const factory FilterFetchResultSearchEvent(
      {required final String text,
      required final String filter}) = _$FilterFetchResultSearchEventImpl;

  factory FilterFetchResultSearchEvent.fromJson(Map<String, dynamic> json) =
      _$FilterFetchResultSearchEventImpl.fromJson;

  String get text;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$FilterFetchResultSearchEventImplCopyWith<
          _$FilterFetchResultSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
