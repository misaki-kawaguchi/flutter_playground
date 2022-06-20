import 'package:bottom_naviigation/pages/home.dart';
import 'package:bottom_naviigation/pages/magazine.dart';
import 'package:bottom_naviigation/pages/notifications.dart';
import 'package:bottom_naviigation/pages/profile.dart';
import 'package:bottom_naviigation/widget/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    Key? key,
    required this.tabItem,
    required this.routerName,
    required this.navigationKey,
  }) : super(key: key);

  final TabItem tabItem;
  final String routerName;
  final GlobalKey<NavigatorState> navigationKey;

  Map<String, Widget Function(BuildContext)> _routerBuilder(BuildContext context) => {
    '/home': (context) => const Home(),
    '/magazine': (context) => const Magazine(),
    '/notification': (context) => const Notifications(),
    '/profile': (context) => const Profile(),
  };

  @override
  Widget build(BuildContext context) {
    final routerBuilder = _routerBuilder(context);

    return Navigator(
      key: navigationKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return routerBuilder[routerName]!(context);
          },
        );
      },
    );
  }
}
