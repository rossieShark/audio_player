// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/services/firebase_service/firebase_service.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/screens/settings_page/settings_index.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
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
          physics: const NeverScrollableScrollPhysics(),
          lightTheme: SettingsThemeData(
            settingsListBackground: AppColors.background.color,
            trailingTextColor: Colors.grey,
            settingsSectionBackground: AppColors.background.color,
            tileHighlightColor: Colors.transparent,
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
                _LanguageSettingTile(),
                _SubscriptionPlanSettingsTile(),
                _CommonDevicesSettingTile(),
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
                  _AccountSettingTile(),
                  _PasswordSettingTile(),
                  _AccountPaymentSettingTile(),
                  _DeleteAccountSettingTile(),
                ]),
            SettingsSection(title: const Text(''), tiles: <SettingsTile>[
              _SignOutSettingTile(),
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

class _SubscriptionPlanSettingsTile extends SettingsTile {
  _SubscriptionPlanSettingsTile()
      : super.navigation(
          leading: const Icon(Icons.subscriptions),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!
                  .settingPageCommonSubscriptionPlan,
            );
          }),
        );
}

class _DeleteAccountSettingTile extends SettingsTile {
  _DeleteAccountSettingTile()
      : super.navigation(
          onPressed: (context) => showDialog(
            context: context,
            builder: (context) => AppAlertDialog(
              onConfirm: () async {
                await FireBaseFunctions().deleteAccount();
                context.pushReplacement(routeNameMap[RouteName.start]!);
              },
              title: AppLocalizations.of(context)!.deleteAccount,
              subtitle: AppLocalizations.of(context)!.deleteAccountAlert,
            ),
          ),
          leading: const Icon(Icons.delete_forever),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageAccountDelete,
            );
          }),
        );
}

class _SignOutSettingTile extends SettingsTile {
  _SignOutSettingTile()
      : super.navigation(
          onPressed: (context) {
            FireBaseFunctions().signOut();
            context.go(routeNameMap[RouteName.start]!);
          },
          title: Center(
            child: Builder(builder: (context) {
              return _CreateSettingsTitle(
                text: AppLocalizations.of(context)!.settingPageLogOut,
              );
            }),
          ),
        );
}

class _AccountPaymentSettingTile extends SettingsTile {
  _AccountPaymentSettingTile()
      : super.navigation(
          leading: const Icon(Icons.payment),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageAccountPayment,
            );
          }),
        );
}

class _PasswordSettingTile extends SettingsTile {
  _PasswordSettingTile()
      : super.navigation(
          onPressed: (BuildContext context) {
            modal.showBarModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ChangePassword(),
            );
          },
          leading: const Icon(Icons.key),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageAccountPassword,
            );
          }),
        );
}

class _AccountSettingTile extends SettingsTile {
  _AccountSettingTile()
      : super.navigation(
          leading: const Icon(Icons.account_box),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageAccount,
            );
          }),
          onPressed: (BuildContext context) {
            modal.showBarModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ChangeUserinfo(),
            );
          },
        );
}

class _CommonDevicesSettingTile extends SettingsTile {
  _CommonDevicesSettingTile()
      : super.navigation(
          leading: const Icon(Icons.devices),
          title: Builder(builder: (context) {
            return _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageCommonDevices,
            );
          }),
        );
}

class _LanguageSettingTile extends SettingsTile {
  _LanguageSettingTile()
      : super.navigation(
          onPressed: (BuildContext context) => ShowAlert().showDialog(
              _ShowCupertinoPicker(pickerData: pickerData), context),
          leading: const Icon(Icons.language),
          title: Builder(
            builder: (context) => _CreateSettingsTitle(
              text: AppLocalizations.of(context)!.settingPageCommonLanguage,
            ),
          ),
          value: Builder(
            builder: (context) =>
                Text(Localizations.localeOf(context).languageCode),
          ),
        );
}

class _ShowCupertinoPicker extends StatelessWidget {
  final List<String> pickerData;

  const _ShowCupertinoPicker({required this.pickerData});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 32.0,
      scrollController: FixedExtentScrollController(
        initialItem: 0,
      ),
      onSelectedItemChanged: (int selectedItem) {
        final newLocale =
            Locale.fromSubtags(languageCode: pickerData[selectedItem]);
        final languagebloc = context.read<LanguageBloc>();
        languagebloc.changeLanguage(newLocale);
      },
      children: List<Widget>.generate(pickerData.length, (int index) {
        return Center(child: Text(pickerData[index]));
      }),
    );
  }
}

class _CreateSettingsTitle extends StatelessWidget {
  final String text;
  const _CreateSettingsTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: FontFamily.poiretOne,
          fontSize: 15,
          color: AppColors.white.color,
          fontWeight: FontWeight.w500),
    );
  }
}
