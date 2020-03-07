import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/pages/announcement_list.dart';
import 'package:len_afisha/pages/information.dart';
import 'package:provider/provider.dart';

class HomePageSideDrawer extends StatelessWidget {
  const HomePageSideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'афиша рдк',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: const Text(
              'обновить',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Provider.of<EventsData>(context, listen: false).fetchEventsData();
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.library_books),
            title: const Text(
              'объявления',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AnnouncementListPage.routName);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: const Text(
              'информация',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, InformationPage.routName);
            },
          ),
        ],
      ),
    );
  }
}
