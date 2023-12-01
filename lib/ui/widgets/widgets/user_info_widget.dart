import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/resources/resources.dart';
import 'package:audio_player/ui/widgets/widgets/widget_exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100 / 2),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration:
                        BoxDecoration(color: AppColors.background.color),
                    child: snapshot.data?.photoURL == null
                        ? Image.asset(AppImages.user)
                        : Image.network(
                            snapshot.data!.photoURL!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?.displayName ??
                            AppLocalizations.of(context)!.userName,
                        style: TextStyle(
                            color: AppColors.white.color, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.followers(1200),
                            style: TextStyle(
                                color: AppColors.white.color, fontSize: 10),
                          ),
                          Text(
                            " · ",
                            style: TextStyle(color: AppColors.white.color),
                          ),
                          Text(
                            AppLocalizations.of(context)!.subscriptions(0),
                            style: TextStyle(
                                color: AppColors.white.color, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
