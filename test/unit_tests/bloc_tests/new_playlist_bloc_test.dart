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
    final folder1 = FavoriteFolder(
      image: 'image',
      title: 'title',
    );

    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits LoadedNewPlaylistState when LoadNewPlaylistEvent is added',
      build: () {
        when(() => repository.returnMyMusicFolderList())
            .thenAnswer((_) async => [addFolder]);
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadNewPlaylistEvent()),
      expect: () => [
        isA<LoadedNewPlaylistState>().having(
          (state) => state.folders,
          'favouriteSongBloc',
          contains(addFolder),
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.returnMyMusicFolderList()).called(1);
      },
    );

    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits EmptyNewPlaylistState when LoadNewPlaylistEvent is added',
      build: () {
        when(() => repository.returnMyMusicFolderList())
            .thenAnswer((_) async => []);
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadNewPlaylistEvent()),
      expect: () => [isA<EmptyNewPlaylistState>()],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.returnMyMusicFolderList()).called(1);
      },
    );
    blocTest<NewPlaylistBloc, NewPlaylistState>(
      'emits LoadedNewPlaylistState when AddNewPlaylistEvent is added',
      build: () {
        when(() => repository.returnMyMusicFolderList())
            .thenAnswer((_) async => [folder1]);
        when(() => repository.convertToFavoriteFolder(addFolder.title))
            .thenAnswer((_) => addFolder);
        when(() => repository.addToFolders(addFolder))
            .thenAnswer((_) async => Future<void>);
        return bloc;
      },
      act: (bloc) => bloc.add(AddNewPlaylistEvent(addFolder.title)),
      expect: () => [
        isA<LoadedNewPlaylistState>().having(
          (state) => state.folders,
          'folders',
          [folder1, addFolder], // Adjust this part with your expected folders
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.returnMyMusicFolderList()).called(1);
        verify(() => repository.addToFolders(addFolder)).called(1);
        verify(() => repository.convertToFavoriteFolder(addFolder.title))
            .called(1);
      },
    );
  });
}
