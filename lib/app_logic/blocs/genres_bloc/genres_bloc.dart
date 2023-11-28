import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/services/services.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository repository;

  GenresBloc(this.repository) : super(const GenresState.loading()) {
    on<FetchGenresEvent>(fetchGenres);
  }

  void fetchGenres(FetchGenresEvent event, Emitter<GenresState> emit) async {
    try {
      final genres = await repository.getAllGenres();
      if (genres.isEmpty) {
        emit(const GenresState.loading());
      } else {
        emit(GenresState.loaded(data: genres));
      }
    } catch (error) {
      emit(const GenresState.error());
      print('Error fetching song detail: $error');
    }
  }
}
