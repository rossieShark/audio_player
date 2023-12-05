import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/index.dart';

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
      'emits AlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailSongInfo(any())).thenAnswer((_) async =>
            const DetailInfoSong(
                artistNames: 'name',
                id: 1,
                imageUrl: 'image',
                preview: 'preview',
                title: 'title',
                type: 'type'));
        return detailMusicPageBloc;
      },
      act: (bloc) => bloc.add(FetchSongDetailEvent('1')),
      expect: () => [
        isA<DetailMusicPageState>(),
      ],
    );
  });
}
