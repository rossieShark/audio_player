import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
// import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_album_bloc/favourites_album_event.dart';
// import 'package:audio_player/app_logic/blocs/favourites_bloc/favourite_album_bloc/favourites_album_states.dart';

// class FavoriteAlbumBloc extends Bloc<FavoriteAlbumEvent, FavoriteAlbumState> {
//   final FavoriteProvider favoriteProvider;

//   FavoriteAlbumBloc(this.favoriteProvider)
//       : super(FavoriteAlbumUpdatedState(false)) {
//     on<ToggleFavoriteAlbumEvent>(_onToggleAlbumFavorite);
//   }

//   void _onToggleAlbumFavorite(
//       ToggleFavoriteAlbumEvent event, Emitter<FavoriteAlbumState> emit) async {
//     final isFavorite = favoriteProvider.isFavoriteAlbum(event.songModel.id);

//     if (isFavorite) {
//       await favoriteProvider.removeFromFavoritesAlbum(event.songModel);
//     } else {
//       await favoriteProvider.addToFavoritesAlbum(event.songModel);
//     }
//     emit(FavoriteAlbumUpdatedState(!isFavorite));
//   }
// }
