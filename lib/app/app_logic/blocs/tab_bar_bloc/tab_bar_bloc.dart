import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TabBarBloc extends Cubit<int> {
  TabBarBloc() : super(1);

  void setTabIndex(int index) {
    emit(index);
  }
}
