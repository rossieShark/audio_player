import 'package:bloc/bloc.dart';

class RecentlyPlayedIdCubit extends Cubit<String?> {
  RecentlyPlayedIdCubit() : super(null);

  void setId(String newId) {
    emit(newId);
  }
}
