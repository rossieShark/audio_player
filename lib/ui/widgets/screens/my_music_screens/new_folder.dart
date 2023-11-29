import 'dart:ui';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/domain/entity/models.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewFolder extends StatefulWidget {
  const NewFolder({super.key});

  @override
  State<NewFolder> createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  late TextEditingController _newFolderTextField;
  @override
  void initState() {
    super.initState();
    _initialiseNewFoldderTextField();
  }

  void _initialiseNewFoldderTextField() {
    _newFolderTextField = TextEditingController();
    _newFolderTextField.text = 'Playlist';
  }

  @override
  void dispose() {
    _newFolderTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black.color.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Padding(
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
                      child: _CreateChangeNameTextField(
                          userNameTextController: _newFolderTextField),
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
                      child: _AddFolderButton(
                          newFolderTextField: _newFolderTextField),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _AddFolderButton extends StatelessWidget {
  const _AddFolderButton({
    super.key,
    required TextEditingController newFolderTextField,
  }) : _newFolderTextField = newFolderTextField;

  final TextEditingController _newFolderTextField;

  @override
  Widget build(BuildContext context) {
    bool isFolderExist = false;
    return BlocBuilder<MyMusicFolderBlocBloc, MyMusicFolderState>(
        builder: (context, state) {
      if (state is LoadedMyMusicFolderState) {
        isFolderExist = state.folders
            .any((folder) => folder.title == _newFolderTextField.text);
      }
      return TextButton(
          onPressed: () {
            if (_newFolderTextField.text.isNotEmpty && !isFolderExist) {
              final folder = FavoriteFolder(
                image: imagesMap[Images.playlist]!,
                title: _newFolderTextField.text,
              );
              final bloc = context.read<MyMusicFolderBlocBloc>();
              bloc.add(AddFolderEvent(folder));
              context.pop();
            } else {
              showDialog(
                context: context,
                builder: (context) => SignAlert(
                  text: AppLocalizations.of(context)!.folderNameMessage,
                ),
              );
            }
          },
          child: Text(
            AppLocalizations.of(context)!.createButton,
            style: TextStyle(
                color: AppColors.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ));
    });
  }
}

class _CreateChangeNameTextField extends StatelessWidget {
  const _CreateChangeNameTextField({
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
