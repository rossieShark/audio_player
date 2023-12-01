// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/screens/settings_page/settings_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as modal;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _signOut() async {
    try {
      await _auth.signOut();

      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> _deleteAccount() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      try {
        await user.delete();
        print('User account deleted');
      } catch (e) {
        print('Error deleting account: $e');
      }
    }
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        padding: const EdgeInsets.only(top: 0.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingPageTitle,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: AppColors.background.color,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SettingsList(
          lightTheme: SettingsThemeData(
            settingsListBackground: AppColors.background.color,
            trailingTextColor: Colors.grey,
            settingsSectionBackground: AppColors.background.color,
            dividerColor: AppColors.background.color,
            titleTextColor: AppColors.white.color,
            inactiveTitleColor: AppColors.white.color,
          ),
          sections: [
            SettingsSection(
              title: Text(
                AppLocalizations.of(context)!.settingPageCommon,
                style: const TextStyle(
                    fontFamily: FontFamily.lusitana,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (context) => _showDialog(
                      CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 32.0,
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            final newLocale = Locale.fromSubtags(
                                languageCode: pickerData[selectedItem]);
                            final languagebloc = context.read<LanguageBloc>();
                            languagebloc.changeLanguage(newLocale);
                          });
                        },
                        children: List<Widget>.generate(pickerData.length,
                            (int index) {
                          return Center(child: Text(pickerData[index]));
                        }),
                      ),
                      context),
                  leading: const Icon(Icons.language),
                  title: Text(
                    AppLocalizations.of(context)!.settingPageCommonLanguage,
                    style: TextStyle(
                        fontFamily: FontFamily.poiretOne,
                        fontSize: 15,
                        color: AppColors.white.color,
                        fontWeight: FontWeight.w500),
                  ),
                  value: Text(Localizations.localeOf(context).languageCode),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.subscriptions),
                  title: Text(
                    AppLocalizations.of(context)!
                        .settingPageCommonSubscriptionPlan,
                    style: TextStyle(
                        fontFamily: FontFamily.poiretOne,
                        fontSize: 15,
                        color: AppColors.white.color,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.devices),
                  title: Text(
                    AppLocalizations.of(context)!.settingPageCommonDevices,
                    style: TextStyle(
                        fontFamily: FontFamily.poiretOne,
                        fontSize: 15,
                        color: AppColors.white.color,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SettingsSection(
                title: Text(
                  AppLocalizations.of(context)!.settingPageAccount,
                  style: const TextStyle(
                      fontFamily: FontFamily.lusitana,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.account_box),
                    title: Text(
                      AppLocalizations.of(context)!.settingPageAccount,
                      style: TextStyle(
                          fontFamily: FontFamily.poiretOne,
                          fontSize: 15,
                          color: AppColors.white.color,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: (BuildContext context) {
                      modal.showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const ChangeUserinfo(),
                      );
                    },
                  ),
                  SettingsTile.navigation(
                    onPressed: (BuildContext context) {
                      modal.showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const ChangePassword(),
                      );
                    },
                    leading: const Icon(Icons.key),
                    title: Text(
                      AppLocalizations.of(context)!.settingPageAccountPassword,
                      style: TextStyle(
                          fontFamily: FontFamily.poiretOne,
                          fontSize: 15,
                          color: AppColors.white.color,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.payment),
                    title: Text(
                      AppLocalizations.of(context)!.settingPageAccountPayment,
                      style: TextStyle(
                          fontFamily: FontFamily.poiretOne,
                          fontSize: 15,
                          color: AppColors.white.color,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SettingsTile.navigation(
                    onPressed: (context) => showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                        onConfirm: () async {
                          await _deleteAccount();
                          await _signOut();
                          Navigator.of(context).pop();
                        },
                        title: AppLocalizations.of(context)!.deleteAccount,
                        subtitle:
                            AppLocalizations.of(context)!.deleteAccountAlert,
                      ),
                    ),
                    leading: const Icon(Icons.delete_forever),
                    title: Text(
                      AppLocalizations.of(context)!.settingPageAccountDelete,
                      style: TextStyle(
                          fontFamily: FontFamily.poiretOne,
                          fontSize: 15,
                          color: AppColors.white.color,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
            SettingsSection(title: const Text(''), tiles: <SettingsTile>[
              SettingsTile(
                onPressed: (context) {
                  _signOut();
                  context.go(routeNameMap[RouteName.sigIn]!);
                },
                title: Center(
                  child: Text(
                    AppLocalizations.of(context)!.settingPageLogOut,
                    style: TextStyle(
                        color: AppColors.accent.color,
                        fontFamily: FontFamily.lusitana,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

List<String> pickerData = [
  'en',
  'de',
  'ru',
];
