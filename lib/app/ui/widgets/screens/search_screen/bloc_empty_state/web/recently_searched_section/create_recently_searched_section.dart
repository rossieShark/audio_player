import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/screens/search_screen/bloc_empty_state/web/recently_searched_section/recently_searched_list_view.dart';
import 'package:flutter/material.dart';

class CreateRecentlySearchedSection extends StatelessWidget {
  const CreateRecentlySearchedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                AppLocalizations.of(context)!.searchHistoryText,
                style: const TextStyle(
                    fontFamily: FontFamily.lusitana,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CreateResentlySearchedListView(
                width: MediaQuery.of(context).size.width),
          ],
        ));
  }
}
