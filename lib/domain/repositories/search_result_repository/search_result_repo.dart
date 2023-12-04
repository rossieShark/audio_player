import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/services/services.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';

class SearchResultRepository {
  final AudioPlayerService _searchResultService;
  SearchResultRepository(this._searchResultService);

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

  Future<List<SearchData>> getSearchAlbumResults(
    int index,
    int limit,
    String q,
  ) async {
    final apiResult =
        await _searchResultService.getSearchAlbumResult(q, index, limit);
    print(apiResult);
    final apiResultResponse = apiResult.body?.data as List<BestAlbumsList>;
    final List<SearchData> searchResult = apiResultResponse.map((album) {
      return SearchData(
        artist:
            SearchDataArtist(image: album.coverImage, name: album.artist.name),
        id: album.id,
        title: album.title,
        type: SearchFilters.album,
        preview: '',
      );
    }).toList();

    return searchResult;
  }

  Future<List<SearchData>> getSearchTrackResults(
    int index,
    int limit,
    String q,
  ) async {
    final apiResult =
        await _searchResultService.getSearchTrackResult(q, index, limit);

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
  String _filter = SearchFilters.all;

  List<SearchData> items = [];
  bool get isLoading => _isLoading;

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
    _isLoading = true;
    if (filter == null || filter == 'All') {
      final newPortion =
          await _searchResultRepository.getSearchResults(_index, _limit, _q);
      items.addAll(newPortion);
      items.addAll(newPortion);
    } else if (filter == SearchFilters.track) {
      final newPortion = await _searchResultRepository.getSearchTrackResults(
          _index, _limit, _q);
      items.addAll(newPortion);
      items.addAll(newPortion);
    } else if (filter == SearchFilters.track) {
      final newPortion = await _searchResultRepository.getSearchAlbumResults(
          _index, _limit, _q);
      items.addAll(newPortion);
      items.addAll(newPortion);
    }

    _isLoading = false;
    _index += _perPage;

    _limit += _perPage;
  }
}
