import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchFilterBloc extends Cubit<String> {
  SearchFilterBloc() : super('All');

  void setNewFilter(String newFilter) {
    emit(newFilter);
  }
}
