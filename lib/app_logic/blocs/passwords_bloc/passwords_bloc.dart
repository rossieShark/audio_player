import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PasswordMissmatchCubit extends Cubit<String> {
  PasswordMissmatchCubit() : super('');

  void passwordMissmatchText(String text) {
    emit(text);
  }
}
