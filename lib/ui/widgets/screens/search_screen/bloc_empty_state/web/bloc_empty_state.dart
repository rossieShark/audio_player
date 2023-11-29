import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_empty_state/web/genres_section/create_genres_section.dart';
import 'package:audio_player/ui/widgets/screens/search_screen/bloc_empty_state/web/recently_searched_section/create_recently_searched_section.dart';
import 'package:audio_player/ui/widgets/widgets/fading_indicator.dart';
import 'package:flutter/material.dart';

class CreateBlocEmptyState extends StatefulWidget {
  const CreateBlocEmptyState({
    super.key,
  });

  @override
  State<CreateBlocEmptyState> createState() => _CreateBlocEmptyStateState();
}

class _CreateBlocEmptyStateState extends State<CreateBlocEmptyState> {
  @override
  void initState() {
    super.initState();
    context.read<RecentlySearchedBloc>().add(LoadRecentlySearchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<RecentlySearchedBloc, RecentlySearchedState>(
          builder: (context, state) {
        return state.map(
          loading: (context) => Center(child: CustomFadingCircleIndicator()),
          empty: (context) => CreateGenresSection(),
          loaded: (data) => const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CreateRecentlySearchedSection(), CreateGenresSection()],
          ),
        );
      }),
    );
  }
}
