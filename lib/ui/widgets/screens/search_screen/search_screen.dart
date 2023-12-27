import 'dart:async';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/filter_bloc.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/screens/index.dart';

import 'package:audio_player/ui/widgets/screens/search_screen/search_export.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final ScrollController _scrollController = ScrollController();
  SearchResultBloc get searchBloc => BlocProvider.of<SearchResultBloc>(context);
  late final TextEditingController _textFieldController =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _setupFocusNodeListener();
    _setupTextFieldListener();
    _setupScrollControllerListener();
  }

  void _setupFocusNodeListener() {
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void _setupTextFieldListener() {
    _textFieldController.addListener(() {
      final filter = context.read<SearchFilterBloc>().state;
      searchBloc.add(SearchEvent.textChanged(
          newText: _textFieldController.text, filter: filter));
    });
  }

  void _setupScrollControllerListener() {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent - 200) {
        if (searchBloc.state is LoadedSearchState) {
          final filter = context.read<SearchFilterBloc>().state;
          searchBloc.add(SearchEvent.loadMoreItems(
              text: _textFieldController.text, filter: filter));
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultBloc, SearchState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.background.color,
        body: Row(
          children: [
            Expanded(
              child: CustomScrollView(controller: _scrollController, slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.background.color,
                  title: _SearchTextField(
                    controller: _textFieldController,
                    focusNode: _focusNode,
                    scrollController: _scrollController,
                  ),
                ),
                PlatformBuilder(
                    web: state.map(
                        empty: (_) => const SliverToBoxAdapter(
                            child: CreateBlocEmptyState()),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) => const NoResultsWidget(),
                        loaded: (loadEvent) => SliverToBoxAdapter(
                              child: CreateSearchSection(
                                scrollController: _scrollController,
                                searchResult: loadEvent.data,
                                textFieldController: _textFieldController,
                              ),
                            )),
                    other: state.map(
                        empty: (_) => const SliverToBoxAdapter(
                              child: MobileRecentlySearchedSection(),
                            ),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) =>
                            const SliverToBoxAdapter(child: NoResultsWidget()),
                        loaded: (loadEvent) => SliverToBoxAdapter(
                              child:
                                  SearchListView(searchResult: loadEvent.data),
                            )),
                    builder: (context, child, widget) {
                      return widget;
                    })
              ]),
            ),
          ],
        ),
      );
    });
  }
}

class _SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ScrollController scrollController;

  const _SearchTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: controller,
        obscureText: false,
        hintText: focusNode.hasFocus
            ? ''
            : AppLocalizations.of(context)!.searchTextFieldHintText,
        focusNode: focusNode,
        width: MediaQuery.of(context).size.width,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        textFieldColor: Colors.transparent,
        textColor: AppColors.white.color,
        borderColor: AppColors.accent.color,
        showSuffixIcon: controller.text.isNotEmpty,
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            scrollController.jumpTo(0.0);
          });
        });
  }
}
