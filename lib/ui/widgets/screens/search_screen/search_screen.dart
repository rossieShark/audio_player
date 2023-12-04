import 'dart:async';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app_logic/blocs/filter_bloc.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

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
      print(filter);
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
                  title: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _SearchTextField(
                      controller: _textFieldController,
                      focusNode: _focusNode,
                      scrollController: _scrollController,
                      // onPressed: () {
                      //   // _textFieldController.clear();
                      //   Future.delayed(const Duration(milliseconds: 500), () {
                      //     _scrollController.jumpTo(0.0);
                      //   });
                      // },
                    ),
                  ),
                ),
                PlatformBuilder(
                    web: state.map(
                        empty: (_) => const CreateBlocEmptyState(),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) => const NoResultsWidget(),
                        loaded: (loadEvent) => CreateSearchSection(
                              scrollController: _scrollController,
                              searchResult: loadEvent.data,
                              textFieldController: _textFieldController,
                            )),
                    other: state.map(
                        empty: (_) => const SliverToBoxAdapter(
                              child: MobileRecentlySearchedSection(),
                            ),
                        loading: (_) => const SliverToBoxAdapter(
                            child: CustomFadingCircleIndicator()),
                        noResults: (_) => const NoResultsWidget(),
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
  // final VoidCallback onPressed;

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
        width: MediaQuery.of(context).size.width - 32,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        textFieldColor: Colors.transparent,
        textColor: AppColors.white.color,
        showSuffixIcon: controller.text.isNotEmpty,
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            scrollController.jumpTo(0.0);
          });
        });

    // TextField(
    //   controller: controller,
    //   cursorColor: AppColors.accent.color,
    //   focusNode: focusNode,
    //   decoration: InputDecoration(
    //     contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
    //     prefixIcon: const Icon(Icons.search, color: Colors.grey),
    //     hintText: focusNode.hasFocus
    //         ? ''
    //         : AppLocalizations.of(context)!.searchTextFieldHintText,
    //     hintStyle: const TextStyle(
    //         fontFamily: FontFamily.poiretOne,
    //         fontSize: 12,
    //         fontWeight: FontWeight.w600,
    //         color: Colors.grey),
    //     labelStyle: TextStyle(color: AppColors.white.color),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(30.0),
    //       borderSide: BorderSide(
    //         color: focusNode.hasFocus
    //             ? AppColors.white.color
    //             : AppColors.accent.color,
    //       ),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(30.0),
    //         borderSide: BorderSide(color: AppColors.white.color)),
    //     suffixIcon: controller.text.isNotEmpty
    //         ? IconButtonWidget(
    //             iconData: Icons.clear,
    //             color: AppColors.accent.color,
    //             onPressed: onPressed,
    //           )
    //         : null,
    //   ),
    //   style: const TextStyle(
    //       fontFamily: FontFamily.poiretOne,
    //       fontSize: 13,
    //       fontWeight: FontWeight.w600,
    //       color: Colors.white),
    // );
  }
}
