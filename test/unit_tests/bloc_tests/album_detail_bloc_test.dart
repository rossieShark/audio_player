import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/album_details_repository/album_details_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('AlbumDetailBloc', () {
    late AlbumDetailBloc albumDetailBloc;
    late MockAlbumDetailsRepository repository;

    setUp(() {
      repository = MockAlbumDetailsRepository();
      albumDetailBloc = AlbumDetailBloc(repository);
    });

    blocTest<AlbumDetailBloc, AlbumDetailBlocState>(
      'emits AlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailAlbums(any())).thenAnswer((_) async => [
              const DetailAlbum(
                  albumid: 1,
                  id: 1,
                  artistNames: 'name',
                  preview: 'preview',
                  title: 'title',
                  type: 'type')
            ]);
        return albumDetailBloc;
      },
      act: (bloc) => bloc.add(FetchAlbumDetailBlocEvent('1')),
      expect: () => [
        isA<LoadedAlbumDetailBlocState>(),
      ],
    );

    blocTest<AlbumDetailBloc, AlbumDetailBlocState>(
      'emits AlbumDetailBlocState when FetchAlbumDetailBlocEvent is added',
      build: () {
        when(() => repository.getDetailAlbums(any()))
            .thenAnswer((_) async => []);
        return albumDetailBloc;
      },
      act: (bloc) => bloc.add(FetchAlbumDetailBlocEvent('1')),
      expect: () => [
        isA<EmptyAlbumDetailBlocState>(),
      ],
    );
    blocTest<AlbumDetailBloc, AlbumDetailBlocState>(
      'emits ErrorState when an error occurs',
      build: () {
        // Mock your repository or service to throw an error
        when(() => repository.getDetailAlbums('1'))
            .thenThrow(Exception('Test Error'));
        return albumDetailBloc;
      },
      act: (bloc) => bloc.add(FetchAlbumDetailBlocEvent('1')),
      expect: () => [
        isA<ErrorAlbumDetailBlocState>(),
      ],
    );
  });
}

class MockAlbumDetailsRepository extends Mock
    implements AlbumDetailsRepository {}
