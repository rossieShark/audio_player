import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/repositories/new_playlist_repository/new_playlist_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewPlaylistRepository extends Mock implements NewPlaylistRepository {}

void main() {
  late NewPlaylistBloc bloc;
  late MockNewPlaylistRepository repository;

  setUp(() {
    repository = MockNewPlaylistRepository();
    bloc = NewPlaylistBloc(repository);
  });

  tearDown(() {
    bloc.close();
  });

  group('NewPlaylistBloc', () {
    final addFolder = FavoriteFolder(
      image: 'image',
      title: 'title2',
    );

    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits LoadedNewPlaylistState when LoadNewPlaylistEvent is added',
      build: () {
        when(() => repository.loadPlaylists())
            .thenAnswer((_) async => [addFolder]);
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadNewPlaylistEvent()),
      expect: () => [
        isA<LoadedNewPlaylistState>().having(
          (state) => state.folders,
          'folders',
          contains(addFolder),
        ),
      ],
      verify: (_) {
        // Verify that loadPlaylists was called
        verify(() => repository.loadPlaylists()).called(1);
      },
    );

    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits EmptyNewPlaylistState when LoadNewPlaylistEvent is added',
      build: () {
        when(() => repository.loadPlaylists()).thenAnswer((_) async => []);
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadNewPlaylistEvent()),
      expect: () => [isA<EmptyNewPlaylistState>()],
      verify: (_) {
        // Verify that loadPlaylists was called
        verify(() => repository.loadPlaylists()).called(1);
      },
    );

    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits LoadedNewPlaylistState when AddNewPlaylistEvent is added',
      build: () {
        when(() => repository.addToFolders(addFolder.title))
            .thenAnswer((_) async => [addFolder]);
        return bloc;
      },
      act: (bloc) => bloc.add(AddNewPlaylistEvent(addFolder.title)),
      expect: () => [
        isA<LoadedNewPlaylistState>().having(
          (state) => state.folders,
          'folders',
          [addFolder], // Adjust this part with your expected folders
        ),
      ],
      verify: (_) {
        // Verify that addToFolders was called
        verify(() => repository.addToFolders(addFolder.title)).called(1);
      },
    );
  });
}
