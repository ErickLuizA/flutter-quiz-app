import 'package:Queszz/presentation/controllers/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthenticationController>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: StreamBuilder<User>(
          stream: authController.authState(),
          builder: (context, snapshot) {
            final user = snapshot.data;

            if (user != null) {
              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Image.network(user.photoURL),
                    ),
                    accountName: Text(user.displayName),
                    accountEmail: Text(user.email),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/leadboard',
                        arguments: {"firebase_id": user.uid},
                      );
                    },
                    title: Text(
                      AppLocalizations.of(context).leadboard,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/statistics');
                    },
                    title: Text(
                      AppLocalizations.of(context).statistics,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    onDetailsPressed: () async {
                      final res = await authController.signIn();

                      if (!res) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(AppLocalizations.of(context).loginFail),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    accountName: Text(AppLocalizations.of(context).clickHere),
                    accountEmail: Text(AppLocalizations.of(context).toLogin),
                  ),
                  ListTile(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text(AppLocalizations.of(context).needToLogin),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    title: Text(
                      AppLocalizations.of(context).leadboard,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/statistics');
                    },
                    title: Text(
                      AppLocalizations.of(context).statistics,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
