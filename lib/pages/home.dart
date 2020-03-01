import 'package:flutter/material.dart';
import 'package:len_afisha/pages/information.dart';
import 'package:len_afisha/pages/rdk_sessions.dart';
import 'package:len_afisha/pages/kids_sessions.dart';
import 'package:len_afisha/pages/movies_sessions.dart';
import 'package:len_afisha/widgets/home_page_drawer.dart';

class HomePage extends StatefulWidget {
  static const routName = 'home-page';
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Widget> _pages = <Widget>[
    MoviesSessionsPage(),
    KidsSessionsPage(),
    RdkSessionsPage(),
  ];

  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onItemTapped(int page) {
    setState(
      () {
        _pageController.animateToPage(page,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
        _selectedPage = page;
      },
    );
  }

  void _onPageChanged(int page) {
    setState(
      () {
        this._selectedPage = page;
      },
    );
  }

  void _refreshEventsData() {
    print('Refreshing data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('кино'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            title: Text('детям'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('рдк'),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedPage,
      ),
      drawer: _buildSideDrawer(),
      appBar: AppBar(
        title: Text(
          'афиша рдк',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: _onPageChanged,
        controller: _pageController,
      ),
    );
  }

  Widget _buildSideDrawer() {
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
              _refreshEventsData();
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
