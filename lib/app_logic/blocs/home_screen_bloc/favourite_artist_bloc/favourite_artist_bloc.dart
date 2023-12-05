import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/home_screen_repositories/favourite_artist_repo.dart';

class FavoriteArtistBloc
    extends Bloc<FavoriteArtistEvent, FavoriteArtistBlocState> {
  final FavoriteArtistRepository repository;

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
    } catch (error) {
      emit(const FavoriteArtistBlocState.error());
      print('Error fetching song detail: $error');
    }
  }

  Future<List<FavoriteArtist>> _returnArtists() async {
    final favoriteArtists = await repository.getFavoriteArtists();
    return favoriteArtists;
  }
}
