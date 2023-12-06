import 'package:audio_player/app_logic/blocs/filter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SearchFilterBloc bloc;

  setUp(() {
    bloc = SearchFilterBloc();
  });

  tearDown(() {
    bloc.close();
  });

  group('SearchFilterBloc', () {
    blocTest<SearchFilterBloc, String>(
      'emits new state when filter is changed',
      build: () => bloc,
      act: (bloc) => bloc.setNewFilter('track'),
      verify: (bloc) {
        // Verify that the emitted state is the expected filter value
        expect(bloc.state, 'track');
      },
    );
  });
}
