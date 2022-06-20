import 'package:bottom_naviigation/pages/home.dart';
import 'package:bottom_naviigation/pages/magazine.dart';
import 'package:bottom_naviigation/pages/notifications.dart';
import 'package:bottom_naviigation/pages/profile.dart';
import 'package:bottom_naviigation/widget/bottom_navigator.dart';
import 'package:bottom_naviigation/widget/tab_item.dart';
import 'package:bottom_naviigation/widget/tab_navigator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabItem _currentTab = TabItem.home;
  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.magazine: GlobalKey<NavigatorState>(),
    TabItem.notifications: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'フィード',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'MAGAZINE',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'お知らせ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'プロフィール',
    ),
  ];
  final tabs = <Widget>[
    const Home(),
    const Magazine(),
    const Notifications(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTabItem(
            TabItem.home,
            '/home',
          ),
          _buildTabItem(
            TabItem.magazine,
            '/magazine',
          ),
          _buildTabItem(
            TabItem.notifications,
            '/notification',
          ),
          _buildTabItem(
            TabItem.profile,
            '/profile',
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 34,
        margin: const EdgeInsets.only(top: 60),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: const Text('Bottom Sheet'),
                  alignment: Alignment.center,
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelect: onSelect,
      ),
    );
  }

  Widget _buildTabItem(
      TabItem tabItem,
      String root,
      ) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigationKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        routerName: root,
      ),
    );
  }

  void onSelect(TabItem tabItem) {
    if (_currentTab == tabItem) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }
}
