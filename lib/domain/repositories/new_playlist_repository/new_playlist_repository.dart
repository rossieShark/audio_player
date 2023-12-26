import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:logging/logging.dart';

abstract class NewPlaylistRepo {
  Future<List<FavoriteFolder>> loadPlaylists();
  Future<List<FavoriteFolder>> addToFolders(String title);
  FavoriteFolder convertToFavoriteFolder(String title);
}

class NewPlaylistRepository implements NewPlaylistRepo {
  final AudioAppDatabase _database;

  NewPlaylistRepository(this._database);
  final Logger _logger = getLogger('NewPlaylistRepository');
  @override
  Future<List<FavoriteFolder>> loadPlaylists() async {
    try {
      final folders = await _database.getFolders();
      final loadedFolders = folders
          .map(
            (folder) => FavoriteFolder(
              title: folder.name,
              image: folder.image,
            ),
          )
          .toList();
      return loadedFolders;
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error loading playlists: $error\n$stackTrace');
      return [];
    }
  }

  @override
  Future<List<FavoriteFolder>> addToFolders(String title) async {
    try {
      final folder = convertToFavoriteFolder(title);
      await _database.insertToMyFolders(
        MyMusicFolder(
          name: folder.title,
          image: folder.image,
        ),
      );
      return await loadPlaylists();
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger.severe('Error adding to folders: $error\n$stackTrace');
      return [];
    }
  }

  @override
  FavoriteFolder convertToFavoriteFolder(String title) {
    try {
      return FavoriteFolder(image: AppImages.playlist, title: title);
    } catch (error, stackTrace) {
      // Handle or log the error as needed
      _logger
          .severe('Error converting to favorite folder: $error\n$stackTrace');
      return FavoriteFolder(image: AppImages.playlist, title: '');
    }
  }
}
