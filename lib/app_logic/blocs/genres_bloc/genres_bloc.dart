import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/repositories/index.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class GenresBloc extends Bloc<GenresEvent, GenresBlocState> {
  final Genres repository;
  final Logger _logger = getLogger('GenresBloc');
  GenresBloc(this.repository) : super(const GenresBlocState.loading()) {
    on<FetchGenresEvent>(fetchGenres);
  }

  void fetchGenres(
      FetchGenresEvent event, Emitter<GenresBlocState> emit) async {
    try {
      final genres = await repository.getAllGenres();
      if (genres.isEmpty) {
        emit(const GenresBlocState.loading());
      } else {
        emit(GenresBlocState.loaded(data: genres));
      }
    } catch (error, stackTrace) {
      emit(const GenresBlocState.error());
      _logger.severe(
          'Error fetching song detail: $error, stack trace: $stackTrace');
    }
  }
}
