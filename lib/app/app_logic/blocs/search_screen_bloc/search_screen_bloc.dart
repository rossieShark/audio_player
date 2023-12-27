import 'dart:async';
import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/domain/repositories/search_result_repository/search_result_repo.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class SearchResultBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;
  final Logger _logger = getLogger('SearchResultBloc');
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
    try {
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
    } catch (error, stackTrace) {
      _logger.severe(
          'Loading SearchResult error: $error, stack trace: $stackTrace');
    }
  }

  Future<void> _onSearchLoadMoreItems(
      LoadMoreItemsSearchEvent event, Emitter<SearchState> emit) async {
    try {
      final albumDetails =
          await repository.getSearchResult(event.text, event.filter);
      emit(SearchState.loaded(data: albumDetails));
    } catch (error, stackTrace) {
      _logger.severe(
          'Loading more SearchResult error: $error, stack trace: $stackTrace');
    }
  }
}

@injectable
class SearchRepository {
  final SearchResultPagination _service;
  SearchRepository(this._service);
  final Logger _logger = getLogger('SearchRepository');
  Future<List<SearchData>> getSearchResult(String q, String? filter) async {
    try {
      await _service.loadMoreItems(q, filter);
      return _service.items;
    } catch (error, stackTrace) {
      _logger.severe('Fetch error  $error, stack trace: $stackTrace');
      return [];
    }
  }
}
