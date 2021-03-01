import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.network(
                  "https://picsum.photos/id/1014/200",
                ),
              ),
              accountName: Text("John Doe"),
              accountEmail: Text("johndoe@gmail.com"),
            ),
            ListTile(
              title: Text(
                "Leadboard",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/statistics');
              },
              title: Text(
                "Statistics",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
