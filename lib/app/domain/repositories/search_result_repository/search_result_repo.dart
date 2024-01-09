import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:audio_player/app/ui/widgets/screens/search_screen/bloc_loaded_state/search_section.dart';

import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class SearchResultRepo {
  Future<List<SearchData>> getSearchResult(
      int index, int limit, String q, String filter);
}

@Injectable(as: SearchResultRepo)
class SearchResultRepository implements SearchResultRepo {
  final AudioPlayerService _searchResultService;
  SearchResultRepository(this._searchResultService);
  final Logger _logger = getLogger('SearchResultRepository');

  Future<List<SearchData>> getSearchAllResults(
    int index,
    int limit,
    String q,
  ) async {
    try {
      final apiResult =
          await _searchResultService.getSearchResult(q, index, limit);

      final apiResultResponse = apiResult.body?.data as List<SearchData>;

      return apiResultResponse;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting search result: $error, stack trace: $stackTrace');
      return [];
    }
  }

  Future<List<SearchData>> getSearchAlbumResults(
    int index,
    int limit,
    String q,
  ) async {
    try {
      final apiResult =
          await _searchResultService.getSearchAlbumResult(q, index, limit);
      final apiResultResponse = apiResult.body?.data as List<BestAlbumsList>;
      final List<SearchData> searchResult = apiResultResponse.map((album) {
        return SearchData(
          artist: SearchDataArtist(
              image: album.coverImage, name: album.artist.name),
          id: album.id,
          title: album.title,
          type: SearchFilters.album,
          preview: '',
        );
      }).toList();

      return searchResult;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting search album result: $error, stack trace: $stackTrace');
      return [];
    }
  }

  Future<List<SearchData>> getSearchTrackResults(
    int index,
    int limit,
    String q,
  ) async {
    try {
      final apiResult =
          await _searchResultService.getSearchTrackResult(q, index, limit);

      final apiResultResponse = apiResult.body?.data as List<SearchData>;

      return apiResultResponse;
    } catch (error, stackTrace) {
      _logger.severe(
          'Error getting search track result: $error, stack trace: $stackTrace');
      return [];
    }
  }

  @override
  Future<List<SearchData>> getSearchResult(
      int index, int limit, String q, String filter) async {
    switch (filter) {
      case SearchFilters.track:
        return await getSearchTrackResults(index, limit, q);
      case SearchFilters.album:
        return await getSearchAlbumResults(index, limit, q);
      default:
        return await getSearchAllResults(index, limit, q);
    }
  }
}

abstract class SearchResultPagination {
  List<SearchData> items = [];
  Future<void> loadMoreItems(String q, String? filter);
}

@Injectable(as: SearchResultPagination)
class SearchResultPaginationService implements SearchResultPagination {
  final SearchResultRepo _searchResultRepository;
  SearchResultPaginationService(this._searchResultRepository);

  bool _isLoading = false;

  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;
  String _q = '';
  String _filter = SearchFilters.all;

  @override
  List<SearchData> items = [];
  bool get isLoading => _isLoading;

  @override
  Future<void> loadMoreItems(String q, String? filter) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q || _filter != filter) {
      _index = 0;
      _limit = _perPage;
      items.clear();
    }
    _q = q;
    _filter = filter ?? SearchFilters.all;
    _isLoading = true;

    final newPortion = await _searchResultRepository.getSearchResult(
        _index, _limit, _q, _filter);
    items.addAll(newPortion);

    _isLoading = false;
    _index += _perPage;

    _limit += _perPage;
  }
}
