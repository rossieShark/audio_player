import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class SearchFilterBloc extends Cubit<String> {
  SearchFilterBloc() : super('All');

  void setNewFilter(String newFilter) {
    emit(newFilter);
  }
}
