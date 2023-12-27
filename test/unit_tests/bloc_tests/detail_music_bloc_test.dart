import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/repositories/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSongDetailRepository extends Mock implements SongDetailRepository {}

void main() {
  group('DetailMusicPageBloc', () {
    late DetailMusicPageBloc detailMusicPageBloc;
    late MockSongDetailRepository repository;

    setUp(() {
      repository = MockSongDetailRepository();
      detailMusicPageBloc = DetailMusicPageBloc(repository);
    });

    blocTest<DetailMusicPageBloc, DetailMusicPageState>(
      'emits LoadedAlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailSongInfo(any())).thenAnswer((_) async =>
            Future.value(const DetailInfoSong(
                id: 1,
                artistNames: 'name',
                preview: 'preview',
                title: 'title',
                type: 'type',
                imageUrl: 'image')));

        return detailMusicPageBloc;
      },
      act: (bloc) => bloc.add(FetchSongDetailEvent('1')),
      expect: () => [isA<LoadedDetailMusicPageState>()],
    );

    blocTest<DetailMusicPageBloc, DetailMusicPageState>(
      'emits EmptyAlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailSongInfo('1'))
            .thenAnswer((_) async => null);
        return detailMusicPageBloc;
      },
      act: (bloc) => bloc.add(FetchSongDetailEvent('1')),
      expect: () => [
        isA<LoadingDetailMusicPageState>(),
      ],
    );
    blocTest<DetailMusicPageBloc, DetailMusicPageState>(
      'emits ErrorAlbumDetailBlocState when an error occurs',
      build: () {
        // Mock your repository or service to throw an error
        when(() => repository.getDetailSongInfo('1'))
            .thenThrow(Exception('Test Error'));
        return detailMusicPageBloc;
      },
      act: (bloc) => bloc.add(FetchSongDetailEvent('1')),
      expect: () => [
        isA<ErrorDetailMusicPageState>(),
      ],
    );
  });
}
