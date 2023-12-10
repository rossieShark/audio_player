import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get recentlyPlayed => 'Kürzlich gespielt';

  @override
  String get favouriteArtists => 'Ihre Lieblingskünstler';

  @override
  String get bestAlbums => 'beste Alben';

  @override
  String get tabBarMyMusic => 'Meine Musik';

  @override
  String get tabBarSearch => 'Suchen';

  @override
  String get albumsFolder => 'Alben';

  @override
  String get tracksFolder => 'Spuren';

  @override
  String get noMusicState => 'Es gibt noch nichts';

  @override
  String followers(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Anhänger';
  }

  @override
  String subscriptions(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return ' $countString Abonnements';
  }

  @override
  String get userName => 'Benutzer';

  @override
  String get playlist => 'Wiedergabeliste';

  @override
  String get artist => 'Künstler';

  @override
  String get addNewPlaylistDesc => 'Geben Sie den Namen der Playlist ein';

  @override
  String get newPlaylistHintName => 'Name der Playlist';

  @override
  String get createButton => 'Erstellen';

  @override
  String get searchHistoryText => 'Suchverlauf';

  @override
  String get searchHistoryResultText => 'Der Suchverlauf ist leer';

  @override
  String get searchTextFieldHintText => 'Lied, Künstlername, Album';

  @override
  String get settingPageTitle => 'Einstellungen';

  @override
  String get settingPageCommon => 'Gemeinsam';

  @override
  String get settingPageCommonLanguage => 'Sprache';

  @override
  String get settingPageCommonSubscriptionPlan => 'Abonnementplan';

  @override
  String get settingPageCommonDevices => 'Geräte';

  @override
  String get settingPageCommonTheme => 'Aktivieren Sie ein Design';

  @override
  String get settingPageAccount => 'Konto';

  @override
  String get changePhotoButton => 'Foto ändern';

  @override
  String get changeNameTextFieldHintText => 'Ihr Name';

  @override
  String get changeNameDesc => 'Dies kann Ihr Vorname oder ein Spitzname sein';

  @override
  String get saveButton => 'Speichern';

  @override
  String get settingPageAccountPassword => 'Passwort';

  @override
  String get settingPageAccountPayment => 'Zahlungsarten';

  @override
  String get settingPageAccountDelete => 'Konto löschen';

  @override
  String get settingPageLogOut => 'Ausloggen';

  @override
  String get browseAll => 'Alle durchsuchen';

  @override
  String get allFilter => 'All';

  @override
  String get trackFilter => 'track';

  @override
  String get artistFilter => 'artist';

  @override
  String get changePassword => 'Kennwort ändern';

  @override
  String get enterPassword => 'Passwort';

  @override
  String get enterEmail => 'Email';

  @override
  String get confirmPassword => 'Bestätigen Sie das Passwort';

  @override
  String get changebutton => 'Ändern';

  @override
  String get incorrectPasswordAlert => 'Falsches Passwort oder falsche E-Mail';

  @override
  String get signInButton => 'Betreten';

  @override
  String get signInMethods => 'Melden Sie sich an mit';

  @override
  String get noAccount => 'Kein Account';

  @override
  String get signUpButton => 'Registrieren';

  @override
  String get invalidEmailPassword => 'Ungültige Emailadresse oder Passwort';

  @override
  String get signUpMethods => 'Registrieren mit';

  @override
  String get alreadyHaveAnAccount => 'Sie haben bereits ein Konto? ';

  @override
  String get confirmButton => 'Bestätigen';

  @override
  String get cancelButton => 'Stornieren';

  @override
  String get okButton => 'OK';

  @override
  String get passwordMissmatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get exitConfirmMessage =>
      'Sind Sie sicher, dass Sie ausgehen möchten?';

  @override
  String get yesButton => 'Ja';

  @override
  String get noButton => 'Nein';

  @override
  String get googleSignError =>
      'Fehler beim Versuch, sich über Google anzumelden.';

  @override
  String get resetPassword => 'Passwort Wiederherstellung';

  @override
  String get sendButton => 'Schicken';

  @override
  String get noDataText => 'No Data';

  @override
  String get error => 'Fehler';

  @override
  String get noName => 'Kein Name';

  @override
  String get homePageTitle => 'Startseite';

  @override
  String get galleryButton => ' Galerie';

  @override
  String get cameraButton => ' Kamera';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String get searchResult => 'Suchergebnis';

  @override
  String get noResultsText => 'Keine Ergebnisse';

  @override
  String get forgotPassword => 'Passwort vergessen';

  @override
  String get deleteAccount => 'Account löschen';

  @override
  String get deleteAccountAlert =>
      'Sind Sie sicher, dass Sie das Konto löschen wollen?';

  @override
  String get folderNameMessage => 'Bitte geben Sie einen eindeutigen Namen ein';

  @override
  String get addNewSongs => 'Neue Lieder hinzufügen';
}
