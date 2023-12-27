import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/services/api_service/service.dart';
import 'package:audio_player/app/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

abstract class SongDetailRepo {
  Future<DetailInfoSong?> getDetailSongInfo(String id);
}

@Injectable(as: SongDetailRepo)
class SongDetailRepository implements SongDetailRepo {
  final AudioAppDatabase _database;
  final AudioPlayerService _songDetailsService;

  SongDetailRepository(this._database, this._songDetailsService);
  final Logger _logger = getLogger('SongDetailRepository');
  @override
  Future<DetailInfoSong?> getDetailSongInfo(String id) async {
    final int songId = int.parse(id);

    final detailSong = await _database.watchDetailSongById(songId).first;

    if (detailSong == null) {
      final apiResponse = await _songDetailsService.getDetailSongs(id);

      if (apiResponse.isSuccessful) {
        final albumAppearances = apiResponse.body;
        final detailSongToInsert = DetailInfoSong(
          type: albumAppearances?.type ?? 'track',
          id: int.parse(id),
          preview: albumAppearances?.preview ?? '',
          artistNames: albumAppearances?.contributors[0].name ?? '',
          title: albumAppearances?.title ?? '',
          imageUrl: albumAppearances?.contributors[0].image ?? '',
        );

        await _database.insertDetailSong(detailSongToInsert);

        return detailSongToInsert;
      } else {
        _logger.severe('API request failed: ${apiResponse.error}');
        return null;
      }
    }

    return detailSong;
  }
}
