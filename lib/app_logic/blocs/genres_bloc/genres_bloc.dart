import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/repositories/index.dart';

class GenresBloc extends Bloc<GenresEvent, GenresBlocState> {
  final GenresRepository repository;

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
    } catch (error) {
      emit(const GenresBlocState.error());
      print('Error fetching song detail: $error');
    }
  }
}
