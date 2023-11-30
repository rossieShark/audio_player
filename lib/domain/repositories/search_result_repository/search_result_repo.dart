import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/services/api_service/service.dart';

class SearchResultRepository {
  final AudioPlayerService _searchResultService;
  SearchResultRepository(this._searchResultService);
//Get search result songs from API
  Future<List<SearchData>> getSearchResults(
    int index,
    int limit,
    String q,
  ) async {
    final apiResult =
        await _searchResultService.getSearchResult(q, index, limit);

    final apiResultResponse = apiResult.body?.data as List<SearchData>;

    return apiResultResponse;
  }
}

class SearchResultPaginationService {
  final SearchResultRepository _searchResultRepository;
  SearchResultPaginationService(this._searchResultRepository);

  bool _isLoading = false;

  final int _perPage = 10;
  int _index = 0;
  int _limit = 10;
  String _q = '';

  List<SearchData> items = [];
  bool get isLoading => _isLoading;

  Future<void> loadMoreItems(String q) async {
    if (q.isEmpty) {
      items.clear();
      return;
    }
    if (_q != q) {
      _index = 0;
      _limit = _perPage;
      items.clear();
    }
    _q = q;
    _isLoading = true;

    final newPortion =
        await _searchResultRepository.getSearchResults(_index, _limit, _q);

    items.addAll(newPortion);

    _isLoading = false;
    _index += _perPage;

    _limit += _perPage;
  }
}
