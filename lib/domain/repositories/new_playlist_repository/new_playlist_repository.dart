import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/resources/resources.dart';

class NewPlaylistRepository {
  final AudioAppDatabase _database;

  NewPlaylistRepository(this._database);
  Future<List<FavoriteFolder>> returnMyMusicFolderList() async {
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
  }

  Future<void> addToFolders(FavoriteFolder folder) async {
    await _database.insertToMyFolders(
      MyMusicFolder(
        name: folder.title,
        image: folder.image,
      ),
    );
  }

  FavoriteFolder convertToFavoriteFolder(String title) {
    return FavoriteFolder(image: AppImages.playlist, title: title);
  }
}
