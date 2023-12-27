import 'package:audio_player/app/domain/entity/favorite_song_model.dart';

abstract class Favourites {
  Future<List<SongModel>> addToFavorites(SongModel detailSong);
  Future<List<SongModel>> removeFromFavorites(SongModel detailSong);
  Future<bool> isFavourite(String albumId);
  Future<List<SongModel>> loadFavourites();
}
