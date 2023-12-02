import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/databases/language_storage/language_storage.dart';
import 'package:audio_player/domain/repositories/index.dart';

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
    GetIt.instance.registerLazySingleton<RecentlyPlayedRepository>(
      () =>
          RecentlyPlayedRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<FavoriteArtistRepository>(
      () =>
          FavoriteArtistRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerFactory<BestAlbumRepository>(
        () => BestAlbumRepository(GetIt.instance.get(), GetIt.instance.get()));

    GetIt.instance.registerLazySingleton<AlbumDetailsRepository>(
      () => AlbumDetailsRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<GenresRepository>(
      () => GenresRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<SongDetailRepository>(
      () => SongDetailRepository(GetIt.instance.get(), GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<SearchResultRepository>(
      () => SearchResultRepository(GetIt.instance.get()),
    );
    GetIt.instance.registerLazySingleton<AlbumRepository>(
      () => AlbumRepository(GetIt.instance.get()),
    );

    GetIt.instance.registerLazySingleton<SearchRepository>(
        () => SearchRepository(GetIt.instance.get()));
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
    GetIt.instance.registerFactory<MyMusicFolderBlocBloc>(
        () => MyMusicFolderBlocBloc(GetIt.instance.get()));
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
  }

  void setupServiceDependencies() {
    GetIt.instance.registerLazySingleton(() => AudioPlayerService.create());

    GetIt.instance.registerFactory<DatabaseService>(
        () => DatabaseService(GetIt.instance.get()));
    GetIt.instance
        .registerLazySingleton<ImagePickerService>(() => ImagePickerService());
    GetIt.instance.registerFactory<BestAlbumsPaginationService>(
        () => BestAlbumsPaginationService(GetIt.instance.get()));

    GetIt.instance.registerFactory<SearchResultPaginationService>(
        () => SearchResultPaginationService(GetIt.instance.get()));
  }
}
