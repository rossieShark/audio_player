import 'dart:ui';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewPlaylist extends StatefulWidget {
  const AddNewPlaylist({super.key});

  @override
  State<AddNewPlaylist> createState() => _AddNewPlaylistState();
}

class _AddNewPlaylistState extends State<AddNewPlaylist> {
  late TextEditingController _newPlaylistTextController;
  @override
  void initState() {
    super.initState();
    _newPlaylistTextController = TextEditingController(text: 'Playlist');
  }

  @override
  void dispose() {
    _newPlaylistTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black.color.withOpacity(0.7),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: Colors.black.withOpacity(1),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.addNewPlaylistDesc,
                      style: TextStyle(
                          color: AppColors.white.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _NewPlaylistTextField(
                          userNameTextController: _newPlaylistTextController),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.accent.color,
                              AppColors.darkAccent.color,
                            ],
                          )),
                      child: _AddNewPlaylistButton(
                          newPlaylistTextController:
                              _newPlaylistTextController),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}

class _AddNewPlaylistButton extends StatelessWidget {
  const _AddNewPlaylistButton({
    required this.newPlaylistTextController,
  });

  final TextEditingController newPlaylistTextController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPlaylistBloc, NewPlaylistState>(
        builder: (context, state) {
      return TextButton(
          onPressed: () => _handleButtonPress(context, state),
          child: Text(
            AppLocalizations.of(context)!.createButton,
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ));
    });
  }

  void _handleButtonPress(BuildContext context, NewPlaylistState state) {
    bool isFolderExist = _checkIfFolderExists(state);
    if (newPlaylistTextController.text.isNotEmpty && !isFolderExist) {
      context
          .read<NewPlaylistBloc>()
          .add(AddNewPlaylistEvent(newPlaylistTextController.text));
      context.pop();
    } else {
      _showFolderNameErrorMessage(context);
    }
  }

  bool _checkIfFolderExists(NewPlaylistState state) {
    if (state is LoadedNewPlaylistState) {
      print(newPlaylistTextController.text);
      return state.folders
          .any((folder) => folder.title == newPlaylistTextController.text);
    }
    return false;
  }

  void _showFolderNameErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SignAlert(
        text: AppLocalizations.of(context)!.folderNameMessage,
      ),
    );
  }
}

class _NewPlaylistTextField extends StatelessWidget {
  const _NewPlaylistTextField({
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _userNameTextController,
      decoration: BoxDecoration(
        color: AppColors.black.color,
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.white.color),
        ),
      ),
      placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      textAlign: TextAlign.center,
      style: TextStyle(color: AppColors.white.color, fontSize: 18),
    );
  }
}
