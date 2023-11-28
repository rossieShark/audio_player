import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/database.dart';

import 'package:audio_player/services/home_screen_service/home_service.dart';

class FavoriteArtistBloc
    extends Bloc<FavoriteArtistEvent, FavoriteArtistState> {
  final FavoriteArtistRepository repository;

  FavoriteArtistBloc(this.repository)
      : super(const FavoriteArtistState.loading()) {
    on<FetchFavoriteArtistsEvent>(_fetchFavoriteArtists);
  }

  void _fetchFavoriteArtists(FetchFavoriteArtistsEvent event,
      Emitter<FavoriteArtistState> emit) async {
    try {
      final favoriteArtists = await _returnArtists();
      if (favoriteArtists.isEmpty) {
        emit(const FavoriteArtistState.loading());
      } else {
        emit(FavoriteArtistState.loaded(data: favoriteArtists));
      }
    } catch (error) {
      emit(const FavoriteArtistState.error());
      print('Error fetching song detail: $error');
    }
  }

  Future<List<FavoriteArtist>> _returnArtists() async {
    final favoriteArtists = await repository.getTracksFromDb();
    if (favoriteArtists.isEmpty) {
      return await repository.getFavoriteArtists();
    } else {
      return favoriteArtists;
    }
  }
}
