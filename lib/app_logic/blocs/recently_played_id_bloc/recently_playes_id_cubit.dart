

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';

class RecentlyPlayedIdCubit extends Cubit<String?> {
  RecentlyPlayedIdCubit() : super(null);

  void setId(String newId) {
    emit(newId);
  }
}
