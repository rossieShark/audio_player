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
abstract class _$$TextChangedSearchEventCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$TextChangedSearchEventCopyWith(_$TextChangedSearchEvent value,
          $Res Function(_$TextChangedSearchEvent) then) =
      __$$TextChangedSearchEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newText, String filter});
}

/// @nodoc
class __$$TextChangedSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$TextChangedSearchEvent>
    implements _$$TextChangedSearchEventCopyWith<$Res> {
  __$$TextChangedSearchEventCopyWithImpl(_$TextChangedSearchEvent _value,
      $Res Function(_$TextChangedSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
    Object? filter = null,
  }) {
    return _then(_$TextChangedSearchEvent(
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
class _$TextChangedSearchEvent implements TextChangedSearchEvent {
  const _$TextChangedSearchEvent(
      {required this.newText, required this.filter, final String? $type})
      : $type = $type ?? 'textChanged';

  factory _$TextChangedSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$TextChangedSearchEventFromJson(json);

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
            other is _$TextChangedSearchEvent &&
            (identical(other.newText, newText) || other.newText == newText) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextChangedSearchEventCopyWith<_$TextChangedSearchEvent> get copyWith =>
      __$$TextChangedSearchEventCopyWithImpl<_$TextChangedSearchEvent>(
          this, _$identity);

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
    return _$$TextChangedSearchEventToJson(
      this,
    );
  }
}

abstract class TextChangedSearchEvent implements SearchEvent {
  const factory TextChangedSearchEvent(
      {required final String newText,
      required final String filter}) = _$TextChangedSearchEvent;

  factory TextChangedSearchEvent.fromJson(Map<String, dynamic> json) =
      _$TextChangedSearchEvent.fromJson;

  String get newText;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$TextChangedSearchEventCopyWith<_$TextChangedSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSearchEventCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$LoadSearchEventCopyWith(
          _$LoadSearchEvent value, $Res Function(_$LoadSearchEvent) then) =
      __$$LoadSearchEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newText, String filter});
}

/// @nodoc
class __$$LoadSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadSearchEvent>
    implements _$$LoadSearchEventCopyWith<$Res> {
  __$$LoadSearchEventCopyWithImpl(
      _$LoadSearchEvent _value, $Res Function(_$LoadSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newText = null,
    Object? filter = null,
  }) {
    return _then(_$LoadSearchEvent(
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
class _$LoadSearchEvent implements LoadSearchEvent {
  const _$LoadSearchEvent(
      {required this.newText, required this.filter, final String? $type})
      : $type = $type ?? 'loadSearchResults';

  factory _$LoadSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$LoadSearchEventFromJson(json);

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
            other is _$LoadSearchEvent &&
            (identical(other.newText, newText) || other.newText == newText) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newText, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSearchEventCopyWith<_$LoadSearchEvent> get copyWith =>
      __$$LoadSearchEventCopyWithImpl<_$LoadSearchEvent>(this, _$identity);

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
    return _$$LoadSearchEventToJson(
      this,
    );
  }
}

abstract class LoadSearchEvent implements SearchEvent {
  const factory LoadSearchEvent(
      {required final String newText,
      required final String filter}) = _$LoadSearchEvent;

  factory LoadSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadSearchEvent.fromJson;

  String get newText;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadSearchEventCopyWith<_$LoadSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreItemsSearchEventCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$LoadMoreItemsSearchEventCopyWith(_$LoadMoreItemsSearchEvent value,
          $Res Function(_$LoadMoreItemsSearchEvent) then) =
      __$$LoadMoreItemsSearchEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String filter});
}

/// @nodoc
class __$$LoadMoreItemsSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadMoreItemsSearchEvent>
    implements _$$LoadMoreItemsSearchEventCopyWith<$Res> {
  __$$LoadMoreItemsSearchEventCopyWithImpl(_$LoadMoreItemsSearchEvent _value,
      $Res Function(_$LoadMoreItemsSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? filter = null,
  }) {
    return _then(_$LoadMoreItemsSearchEvent(
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
class _$LoadMoreItemsSearchEvent implements LoadMoreItemsSearchEvent {
  const _$LoadMoreItemsSearchEvent(
      {required this.text, required this.filter, final String? $type})
      : $type = $type ?? 'loadMoreItems';

  factory _$LoadMoreItemsSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$LoadMoreItemsSearchEventFromJson(json);

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
            other is _$LoadMoreItemsSearchEvent &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreItemsSearchEventCopyWith<_$LoadMoreItemsSearchEvent>
      get copyWith =>
          __$$LoadMoreItemsSearchEventCopyWithImpl<_$LoadMoreItemsSearchEvent>(
              this, _$identity);

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
    return _$$LoadMoreItemsSearchEventToJson(
      this,
    );
  }
}

abstract class LoadMoreItemsSearchEvent implements SearchEvent {
  const factory LoadMoreItemsSearchEvent(
      {required final String text,
      required final String filter}) = _$LoadMoreItemsSearchEvent;

  factory LoadMoreItemsSearchEvent.fromJson(Map<String, dynamic> json) =
      _$LoadMoreItemsSearchEvent.fromJson;

  String get text;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadMoreItemsSearchEventCopyWith<_$LoadMoreItemsSearchEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterFetchResultSearchEventCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$FilterFetchResultSearchEventCopyWith(
          _$FilterFetchResultSearchEvent value,
          $Res Function(_$FilterFetchResultSearchEvent) then) =
      __$$FilterFetchResultSearchEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String filter});
}

/// @nodoc
class __$$FilterFetchResultSearchEventCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$FilterFetchResultSearchEvent>
    implements _$$FilterFetchResultSearchEventCopyWith<$Res> {
  __$$FilterFetchResultSearchEventCopyWithImpl(
      _$FilterFetchResultSearchEvent _value,
      $Res Function(_$FilterFetchResultSearchEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? filter = null,
  }) {
    return _then(_$FilterFetchResultSearchEvent(
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
class _$FilterFetchResultSearchEvent implements FilterFetchResultSearchEvent {
  const _$FilterFetchResultSearchEvent(
      {required this.text, required this.filter, final String? $type})
      : $type = $type ?? 'filterFetchResult';

  factory _$FilterFetchResultSearchEvent.fromJson(Map<String, dynamic> json) =>
      _$$FilterFetchResultSearchEventFromJson(json);

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
            other is _$FilterFetchResultSearchEvent &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterFetchResultSearchEventCopyWith<_$FilterFetchResultSearchEvent>
      get copyWith => __$$FilterFetchResultSearchEventCopyWithImpl<
          _$FilterFetchResultSearchEvent>(this, _$identity);

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
    return _$$FilterFetchResultSearchEventToJson(
      this,
    );
  }
}

abstract class FilterFetchResultSearchEvent implements SearchEvent {
  const factory FilterFetchResultSearchEvent(
      {required final String text,
      required final String filter}) = _$FilterFetchResultSearchEvent;

  factory FilterFetchResultSearchEvent.fromJson(Map<String, dynamic> json) =
      _$FilterFetchResultSearchEvent.fromJson;

  String get text;
  @override
  String get filter;
  @override
  @JsonKey(ignore: true)
  _$$FilterFetchResultSearchEventCopyWith<_$FilterFetchResultSearchEvent>
      get copyWith => throw _privateConstructorUsedError;
}
