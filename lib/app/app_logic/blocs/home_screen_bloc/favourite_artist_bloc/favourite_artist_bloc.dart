import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/repositories/home_screen_repositories/favourite_artist_repo.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class FavoriteArtistBloc
    extends Bloc<FavoriteArtistEvent, FavoriteArtistBlocState> {
  final FavoriteArtistRepo repository;
  final Logger _logger = getLogger('FavoriteArtistBloc');
  FavoriteArtistBloc(this.repository)
      : super(const FavoriteArtistBlocState.loading()) {
    on<FetchFavoriteArtistsEvent>(_fetchFavoriteArtists);
  }

  void _fetchFavoriteArtists(FetchFavoriteArtistsEvent event,
      Emitter<FavoriteArtistBlocState> emit) async {
    try {
      final favoriteArtists = await _returnArtists();
      if (favoriteArtists.isEmpty) {
        emit(const FavoriteArtistBlocState.loading());
      } else {
        emit(FavoriteArtistBlocState.loaded(data: favoriteArtists));
      }
    } catch (error, stackTrace) {
      emit(const FavoriteArtistBlocState.error());
      _logger.severe(
          'Error fetching song detail: $error, stack trace: $stackTrace');
    }
  }

  Future<List<FavoriteArtist>> _returnArtists() async {
    final favoriteArtists = await repository.getFavoriteArtists();
    return favoriteArtists;
  }
}
