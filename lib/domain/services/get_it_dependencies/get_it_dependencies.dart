import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/filter_bloc.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/databases/language_storage/language_storage.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_album_repository.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_song_repository.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/repositories/new_playlist_repository/new_playlist_repository.dart';
import 'package:audio_player/domain/repositories/recently_searched_repository/recently_searched_repository.dart';

import 'package:audio_player/domain/services/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';

class SetGetItDependencies {
  void setupDatabaseDependencies() {
    GetIt.I.registerLazySingleton<AudioAppDatabase>(AudioAppDatabase.new);
    GetIt.I.registerLazySingleton<LanguageStorage>(LanguageStorage.new);
  }

  void setupProviderDependencies() {
    GetIt.instance.registerLazySingleton<AudioPlayer>(
      () => AudioPlayer(),
    );
  }

  void setupRepoDependencies() {
    GetIt.instance.registerFactory<RecentlyPlayedRepo>(
      () =>
          RecentlyPlayedRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<FavoriteArtistRepo>(
      () =>
          FavoriteArtistRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<BestAlbums>(
        () => BestAlbumRepository(GetIt.instance.get(), GetIt.instance.get()));

    GetIt.instance.registerFactory<AlbumDetails>(
      () => AlbumDetailsRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<Genres>(
      () => GenresRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<SongDetailRepo>(
      () => SongDetailRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<SearchResultRepo>(
      () => SearchResultRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<AlbumRepository>(
      () => AlbumRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<RecentlySearchedRepo>(
      () => RecentlySearchedRepository(GetIt.instance.get()),
    );

    GetIt.instance.registerFactory<SearchRepository>(
        () => SearchRepository(GetIt.instance.get()));
    GetIt.instance.registerFactory<FavouriteAlbumRepository>(
        () => FavouriteAlbumRepository(GetIt.instance.get()));
    GetIt.instance.registerFactory<FavouriteSongRepository>(
        () => FavouriteSongRepository(GetIt.instance.get()));
    GetIt.instance.registerFactory<NewPlaylistRepo>(
        () => NewPlaylistRepository(GetIt.instance.get()));
  }

  void setupBlocDependencies() {
    GetIt.I.registerSingleton<TabBarBloc>(
      TabBarBloc(),
    );
    GetIt.instance
        .registerFactory<AlbumBloc>(() => AlbumBloc(GetIt.instance.get()));

    GetIt.instance.registerFactory<FavoriteArtistBloc>(
        () => FavoriteArtistBloc(GetIt.instance.get()));

    GetIt.instance.registerFactory<RecentlyPlayedBloc>(
        () => RecentlyPlayedBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<SearchResultBloc>(
        () => SearchResultBloc(GetIt.instance.get()));
    GetIt.instance
        .registerFactory<GenresBloc>(() => GenresBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<RecentlySearchedBloc>(
        () => RecentlySearchedBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<AlbumDetailBloc>(
        () => AlbumDetailBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<FavoriteSongBloc>(
        () => FavoriteSongBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<FavoriteAlbumBloc>(
        () => FavoriteAlbumBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<NewPlaylistBloc>(
        () => NewPlaylistBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<DetailMusicPageBloc>(
        () => DetailMusicPageBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<LanguageBloc>(
        () => LanguageBloc(GetIt.instance.get()));
    GetIt.instance
        .registerFactory<MusicBloc>(() => MusicBloc(GetIt.instance.get()));
    GetIt.instance
        .registerFactory<ImageBloc>(() => ImageBloc(GetIt.instance.get()));
    GetIt.instance.registerFactory<PasswordMissmatchCubit>(
        () => PasswordMissmatchCubit());
    GetIt.instance.registerFactory<SearchFilterBloc>(() => SearchFilterBloc());
  }

  void setupServiceDependencies() {
    GetIt.instance.registerLazySingleton(() => AudioPlayerService.create());

    GetIt.instance
        .registerFactory<ImagePickerService>(() => ImagePickerService());
    GetIt.instance.registerFactory<BestAlbumsPagination>(
        () => BestAlbumsPaginationService(GetIt.instance.get()));

    GetIt.instance.registerFactory<SearchResultPagination>(
        () => SearchResultPaginationService(GetIt.instance.get()));
  }
}
