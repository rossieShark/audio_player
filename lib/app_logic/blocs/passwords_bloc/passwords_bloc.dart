import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordMissmatchCubit extends Cubit<String> {
  PasswordMissmatchCubit() : super('');

  void passwordMissmatchText(String text) {
    emit(text);
  }
}
