import 'dart:async';
import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/search_result_repository/search_result_repo.dart';

class SearchResultBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  Timer? loadResultsTimer;
  SearchResultBloc(this.repository) : super(const SearchState.empty()) {
    on<TextChangedSearchEvent>(onSearchTextChanged);
    on<LoadSearchEvent>(onLoadSearchResults);
    on<LoadMoreItemsSearchEvent>(_onSearchLoadMoreItems);
  }

  Future<void> onSearchTextChanged(
      TextChangedSearchEvent event, Emitter<SearchState> emit) async {
    loadResultsTimer?.cancel();
    loadResultsTimer = Timer(const Duration(milliseconds: 500), () {
      add(SearchEvent.loadSearchResults(
          newText: event.newText, filter: event.filter));
    });
  }

  Future<void> onLoadSearchResults(
      LoadSearchEvent event, Emitter<SearchState> emit) async {
    if (event.newText.isEmpty) {
      emit(const SearchState.empty());
      return;
    }
    emit(const SearchState.loading());
    final searchResult =
        await repository.getSearchResult(event.newText, event.filter);
    if (searchResult.isEmpty) {
      emit(const SearchState.noResults());
      return;
    }
    emit(SearchState.loaded(data: searchResult));
  }

  Future<void> _onSearchLoadMoreItems(
      LoadMoreItemsSearchEvent event, Emitter<SearchState> emit) async {
    final albumDetails =
        await repository.getSearchResult(event.text, event.filter);
    emit(SearchState.loaded(data: albumDetails));
  }
}

class SearchRepository {
  final SearchResultPagination _service;
  SearchRepository(this._service);
  Future<List<SearchData>> getSearchResult(String q, String? filter) async {
    await _service.loadMoreItems(q, filter);
    return _service.items;
  }
}
