import 'package:bottom_naviigation/widget/tab_item.dart';
import 'package:flutter/material.dart';

const tabTitle = <TabItem, String>{
  TabItem.home: 'フィード',
  TabItem.magazine: 'MAGAZINE',
  TabItem.add: '',
  TabItem.notifications: 'お知らせ',
  TabItem.profile: 'プロフィール',
};
const tabIcon = <TabItem, IconData?>{
  TabItem.home: Icons.home,
  TabItem.magazine: Icons.newspaper,
  TabItem.add: null,
  TabItem.notifications: Icons.notifications,
  TabItem.profile: Icons.person,
};

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelect,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelect;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontSize: 11,
      ),
      unselectedItemColor: const Color(0xFFBEBEBE),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
      ),
      items: <BottomNavigationBarItem>[
        bottomItem(
          context,
          tabItem: TabItem.home,
        ),
        bottomItem(
          context,
          tabItem: TabItem.magazine,
        ),
        bottomItem(
          context,
          tabItem: TabItem.add,
        ),
        bottomItem(
          context,
          tabItem: TabItem.notifications,
        ),
        bottomItem(
          context,
          tabItem: TabItem.profile,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        widget.onSelect(TabItem.values[index]);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  BottomNavigationBarItem bottomItem(
      BuildContext context, {
        TabItem? tabItem,
      }) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
      ),
      label: tabTitle[tabItem],
    );
  }
}
