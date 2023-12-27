// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/app_logic/blocs/album_detail_bloc/album_detail_bloc.dart'
    as _i37;
import '../../app/app_logic/blocs/detail_music_bloc/detail_music_bloc.dart'
    as _i28;
import '../../app/app_logic/blocs/favourites_bloc/favourite_album_bloc/favourites_album_bloc.dart'
    as _i29;
import '../../app/app_logic/blocs/favourites_bloc/favourite_song_bloc/favourites_song_bloc.dart'
    as _i31;
import '../../app/app_logic/blocs/filter_bloc.dart' as _i22;
import '../../app/app_logic/blocs/genres_bloc/genres_bloc.dart' as _i13;
import '../../app/app_logic/blocs/home_screen_bloc/album_bloc/album_bloc.dart'
    as _i27;
import '../../app/app_logic/blocs/home_screen_bloc/favourite_artist_bloc/favourite_artist_bloc.dart'
    as _i30;
import '../../app/app_logic/blocs/home_screen_bloc/recently_played_bloc/recently_played_bloc.dart'
    as _i35;
import '../../app/app_logic/blocs/image_bloc/image_bloc.dart' as _i32;
import '../../app/app_logic/blocs/language_bloc/language_bloc.dart' as _i33;
import '../../app/app_logic/blocs/music_bloc/music_bloc.dart' as _i17;
import '../../app/app_logic/blocs/new_playlist_bloc/my_music_foldder_bloc.dart'
    as _i34;
import '../../app/app_logic/blocs/passwords_bloc/passwords_bloc.dart' as _i19;
import '../../app/app_logic/blocs/recently_searched_bloc/recently_searched_bloc.dart'
    as _i36;
import '../../app/app_logic/blocs/search_screen_bloc/search_screen_bloc.dart'
    as _i38;
import '../../app/app_logic/blocs/tab_bar_bloc/tab_bar_bloc.dart' as _i25;
import '../../app/databases/app_database/database.dart' as _i3;
import '../../app/databases/language_storage/language_storage.dart' as _i16;
import '../../app/domain/repositories/album_details_repository/album_details_repository.dart'
    as _i26;
import '../../app/domain/repositories/favourites_repository.dart/favourite_album_repository.dart'
    as _i11;
import '../../app/domain/repositories/favourites_repository.dart/favourite_song_repository.dart'
    as _i10;
import '../../app/domain/repositories/favourites_repository.dart/favourites_repo.dart'
    as _i9;
import '../../app/domain/repositories/genres_repository/genres_repository.dart'
    as _i12;
import '../../app/domain/repositories/home_screen_repositories/best_album_repo.dart'
    as _i6;
import '../../app/domain/repositories/home_screen_repositories/favourite_artist_repo.dart'
    as _i8;
import '../../app/domain/repositories/home_screen_repositories/recently_played_repo.dart'
    as _i20;
import '../../app/domain/repositories/index.dart' as _i14;
import '../../app/domain/repositories/new_playlist_repository/new_playlist_repository.dart'
    as _i18;
import '../../app/domain/repositories/recently_searched_repository/recently_searched_repository.dart'
    as _i21;
import '../../app/domain/repositories/search_result_repository/search_result_repo.dart'
    as _i23;
import '../../app/domain/repositories/song_detail_repository/song_detail_repository.dart'
    as _i24;
import '../../app/domain/services/api_service/service.dart' as _i5;
import '../../app/domain/services/image_picker_service/image_picker_service.dart'
    as _i15;
import '../../app/domain/services/services.dart' as _i7;
import 'injectable_module.dart' as _i39;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.AudioAppDatabase>(() => _i3.AudioAppDatabase());
    gh.lazySingleton<_i4.AudioPlayer>(() => injectableModule.audioPlayer);
    gh.lazySingleton<_i5.AudioPlayerService>(
        () => injectableModule.audioPlayerService);
    gh.factory<_i6.BestAlbums>(() => _i6.BestAlbumRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i7.AudioPlayerService>(),
        ));
    gh.factory<_i6.BestAlbumsPagination>(
        () => _i6.BestAlbumsPaginationService(gh<_i6.BestAlbums>()));
    gh.factory<_i8.FavoriteArtistRepo>(() => _i8.FavoriteArtistRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i7.AudioPlayerService>(),
        ));
    gh.factory<_i9.Favourites>(
      () => _i10.FavouriteSongRepository(gh<_i3.AudioAppDatabase>()),
      instanceName: 'favouriteSongs',
    );
    gh.factory<_i9.Favourites>(
      () => _i11.FavouriteAlbumRepository(gh<_i3.AudioAppDatabase>()),
      instanceName: 'favouriteAlbums',
    );
    gh.factory<_i12.Genres>(() => _i12.GenresRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i7.AudioPlayerService>(),
        ));
    gh.factory<_i13.GenresBloc>(() => _i13.GenresBloc(gh<_i14.Genres>()));
    gh.factory<_i15.ImagePickerService>(
        () => injectableModule.imagePickerService);
    gh.lazySingleton<_i16.LanguageStorage>(() => _i16.LanguageStorage());
    gh.factory<_i17.MusicBloc>(() => _i17.MusicBloc(gh<_i4.AudioPlayer>()));
    gh.factory<_i18.NewPlaylistRepo>(
        () => _i18.NewPlaylistRepository(gh<_i3.AudioAppDatabase>()));
    gh.factory<_i19.PasswordMissmatchCubit>(
        () => _i19.PasswordMissmatchCubit());
    gh.factory<_i20.RecentlyPlayedRepo>(() => _i20.RecentlyPlayedRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i7.AudioPlayerService>(),
        ));
    gh.factory<_i21.RecentlySearchedRepo>(
        () => _i21.RecentlySearchedRepository(gh<_i3.AudioAppDatabase>()));
    gh.factory<_i22.SearchFilterBloc>(() => _i22.SearchFilterBloc());
    gh.factory<_i23.SearchResultRepo>(
        () => _i23.SearchResultRepository(gh<_i7.AudioPlayerService>()));
    gh.factory<_i24.SongDetailRepo>(() => _i24.SongDetailRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i5.AudioPlayerService>(),
        ));
    gh.factory<_i25.TabBarBloc>(() => _i25.TabBarBloc());
    gh.factory<_i26.AlbumDetails>(() => _i26.AlbumDetailsRepository(
          gh<_i3.AudioAppDatabase>(),
          gh<_i7.AudioPlayerService>(),
        ));
    gh.factory<_i27.AlbumRepository>(
        () => _i27.AlbumRepository(gh<_i6.BestAlbumsPagination>()));
    gh.factory<_i28.DetailMusicPageBloc>(
        () => _i28.DetailMusicPageBloc(gh<_i14.SongDetailRepo>()));
    gh.factory<_i29.FavoriteAlbumBloc>(() => _i29.FavoriteAlbumBloc(
        gh<_i9.Favourites>(instanceName: 'favouriteAlbums')));
    gh.factory<_i30.FavoriteArtistBloc>(
        () => _i30.FavoriteArtistBloc(gh<_i8.FavoriteArtistRepo>()));
    gh.factory<_i31.FavoriteSongBloc>(() => _i31.FavoriteSongBloc(
        gh<_i9.Favourites>(instanceName: 'favouriteSongs')));
    gh.factory<_i32.ImageBloc>(
        () => _i32.ImageBloc(gh<_i7.ImagePickerService>()));
    gh.factory<_i33.LanguageBloc>(
        () => _i33.LanguageBloc(gh<_i16.LanguageStorage>()));
    gh.factory<_i34.NewPlaylistBloc>(
        () => _i34.NewPlaylistBloc(gh<_i18.NewPlaylistRepo>()));
    gh.factory<_i35.RecentlyPlayedBloc>(
        () => _i35.RecentlyPlayedBloc(gh<_i20.RecentlyPlayedRepo>()));
    gh.factory<_i36.RecentlySearchedBloc>(
        () => _i36.RecentlySearchedBloc(gh<_i21.RecentlySearchedRepo>()));
    gh.factory<_i23.SearchResultPagination>(
        () => _i23.SearchResultPaginationService(gh<_i23.SearchResultRepo>()));
    gh.factory<_i27.AlbumBloc>(
        () => _i27.AlbumBloc(gh<_i27.AlbumRepository>()));
    gh.factory<_i37.AlbumDetailBloc>(
        () => _i37.AlbumDetailBloc(gh<_i14.AlbumDetails>()));
    gh.factory<_i38.SearchRepository>(
        () => _i38.SearchRepository(gh<_i23.SearchResultPagination>()));
    gh.factory<_i38.SearchResultBloc>(
        () => _i38.SearchResultBloc(gh<_i38.SearchRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i39.InjectableModule {}
