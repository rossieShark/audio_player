// ignore_for_file: use_build_context_synchronously

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/ui/navigation/navigation_routes.dart';

import 'package:audio_player/ui/widgets/widgets/app_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseFunctions {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  Future<bool> signInWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      FirebaseAuth.instance.userChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      final googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print('Error google signing in: $e');
      return false;
    }
  }

  Future<void> validSignWithGoogle(BuildContext context) async {
    bool success = await FireBaseFunctions().signInWithGoogle();
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      await showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.googleSignError),
      );
    }
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    bool success = await FireBaseFunctions().register(email, password);
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.invalidEmailPassword),
      );
    }
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    bool success = await _signIn(email, password);
    if (success) {
      return context.go(routeNameMap[RouteName.home]!);
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            SignAlert(text: AppLocalizations.of(context)!.invalidEmailPassword),
      );
    }
  }

  Future<void> deleteAccount() async {
    if (_user != null) {
      try {
        await _user!.delete();
        print('User account deleted');
      } catch (e) {
        print('Error deleting account: $e');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();

      print('User signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void resetPassword(BuildContext context, TextEditingController controller) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.resetPassword),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            controller: controller,
            placeholder: AppLocalizations.of(context)!.enterEmail,
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.sendButton),
            onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: controller.text,
              );
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.cancelButton),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> changePassword(
    String password,
    String newPassword,
    BuildContext context,
  ) async {
    if (password == newPassword) {
      await _user?.updatePassword(password);
      context.pop();
    } else {
      context.read<PasswordMissmatchCubit>().passwordMissmatchText(
          AppLocalizations.of(context)!.passwordMissmatch);
    }
  }

  Future<bool> _signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }

  Future<void> changeUserInfo(String? image, String userName) async {
    if (image == null) return;
    await _user?.updatePhotoURL(image);

    if (userName.isNotEmpty) {
      await _user?.updateDisplayName(userName);
    }
  }
}
