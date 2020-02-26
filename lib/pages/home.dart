import 'package:flutter/material.dart';
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

  void onPageChanged(int page) {
    setState(
      () {
        this._selectedPage = page;
      },
    );
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
      drawer: BuildOverviewPageDrawer(),
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
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
}
