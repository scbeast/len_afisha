import 'package:flutter/material.dart';
import 'package:len_afisha/models/events.dart';
import 'package:len_afisha/pages/information.dart';
import 'package:provider/provider.dart';

class BuildOverviewPageDrawer extends StatelessWidget {
  const BuildOverviewPageDrawer({Key key}) : super(key: key);

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
            title: Text(
              'обновить данные',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              EventsData().iAmBusyNow = true;
              Provider.of<EventsData>(context, listen: false).fetchEventsData();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
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
