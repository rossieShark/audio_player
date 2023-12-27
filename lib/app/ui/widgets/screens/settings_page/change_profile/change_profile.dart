import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/domain/services/services.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/app/ui/widgets/screens/settings_page/change_profile/change_user_photo.dart';
import 'package:audio_player/app/ui/widgets/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeUserinfo extends StatefulWidget {
  const ChangeUserinfo({super.key});

  @override
  State<ChangeUserinfo> createState() => _ChangeUserinfoState();
}

class _ChangeUserinfoState extends State<ChangeUserinfo> {
  late TextEditingController _userNameTextController;

  @override
  void initState() {
    super.initState();
    _userNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageBlocState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: AppColors.background.color,
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              _CreateImageWidget(
                image: state.image,
              ),
              const ChangeUserPhotoWidget(),
              const SizedBox(
                height: 20,
              ),
              _CreateChangeNameTextField(
                  userNameTextController: _userNameTextController),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.changeNameDesc,
                  style: TextStyle(color: AppColors.white.color, fontSize: 10),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomButton(
                    onPressed: () async {
                      FireBaseFunctions().changeUserInfo(
                          state.image, _userNameTextController.text);
                      context.pop();
                    },
                    buttonText: AppLocalizations.of(context)!.saveButton),
              )
            ],
          ));
    });
  }
}

class _CreateImageWidget extends StatelessWidget {
  final String? image;
  const _CreateImageWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150 / 2),
        child: SizedBox(
          width: 150,
          height: 150,
          child: image != null
              ? Image.network(
                  image!,
                  fit: BoxFit.cover,
                )
              : user?.photoURL == null
                  ? Image.asset(
                      AppImages.user,
                      fit: BoxFit.cover,
                    )
                  : Image.network(user!.photoURL!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _CreateChangeNameTextField extends StatelessWidget {
  const _CreateChangeNameTextField({
    required TextEditingController userNameTextController,
  }) : _userNameTextController = userNameTextController;

  final TextEditingController _userNameTextController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3 * 2,
        child: CupertinoTextField(
          controller: _userNameTextController,
          decoration: BoxDecoration(
            color: AppColors.background.color,
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.white.color),
            ),
          ),
          placeholder:
              AppLocalizations.of(context)!.changeNameTextFieldHintText,
          placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white.color, fontSize: 18),
        ),
      ),
    );
  }
}
