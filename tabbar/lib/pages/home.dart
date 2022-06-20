import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Tabs Demo',
            ),
            bottom: const TabBar(
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(
                  child: Text(
                    "最新の記事",
                  ),
                ),
                Tab(
                  child: Text(
                    "人気の記事",
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(
                Icons.directions_car,
              ),
              Icon(
                Icons.directions_bike,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
