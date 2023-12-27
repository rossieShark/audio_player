import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/app_logic/blocs/filter_bloc.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/app/domain/entity/models.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/screens/search_screen/search_export.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class CreateSearchSection extends StatelessWidget {
  final TextEditingController textFieldController;
  final List<SearchData> searchResult;
  final ScrollController scrollController;

  const CreateSearchSection(
      {super.key,
      required this.textFieldController,
      required this.searchResult,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      narrow: (context) => NarrowSearchSection(searchResult: searchResult),
      other: (context) => WideSearchSection(
          textFieldController: textFieldController, searchResult: searchResult),
    );
  }
}

class WideSearchSection extends StatelessWidget {
  const WideSearchSection({
    super.key,
    required this.textFieldController,
    required this.searchResult,
  });

  final TextEditingController textFieldController;
  final List<SearchData> searchResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchFilterWidget(textFieldController: textFieldController),
        SearchListView(
          searchResult: searchResult,
        ),
      ],
    );
  }
}

class NarrowSearchSection extends StatelessWidget {
  const NarrowSearchSection({
    super.key,
    required this.searchResult,
  });

  final List<SearchData> searchResult;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.searchResult,
              style: const TextStyle(
                  fontFamily: FontFamily.lusitana,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      SearchListView(
        searchResult: searchResult,
      ),
    ]);
  }
}

class _SearchFilterWidget extends StatelessWidget {
  const _SearchFilterWidget({
    required this.textFieldController,
  });

  final TextEditingController textFieldController;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int index = 0;
                  index < SearchFilters.searchFilters.length;
                  index++)
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: FilterButtonCard(
                      filter: SearchFilters.searchFilters[index],
                      textFieldController: textFieldController,
                    ))
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButtonCard extends StatelessWidget {
  final String filter;
  final TextEditingController textFieldController;
  const FilterButtonCard(
      {super.key, required this.filter, required this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.withOpacity(0.1)),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextButton(
              onPressed: () => _onFilterPressed(context),
              child: Text(
                filter,
                style: TextStyle(
                  color: AppColors.accent.color,
                ),
              ),
            )),
      ),
    );
  }

  void _onFilterPressed(BuildContext context) {
    final filterBloc = context.read<SearchFilterBloc>();
    filterBloc.setNewFilter(filter);
    final albumBloc = BlocProvider.of<SearchResultBloc>(context);
    albumBloc.add(SearchEvent.textChanged(
        newText: textFieldController.text, filter: filterBloc.state));
  }
}

class SearchFilters {
  static const String all = 'All';
  static const String track = 'track';
  static const String album = 'album';

  static const List<String> searchFilters = [all, track, album];
}
