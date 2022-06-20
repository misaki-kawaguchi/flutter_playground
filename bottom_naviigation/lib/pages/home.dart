import 'package:bottom_naviigation/pages/detail.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('フィード'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: const Text('BottomNavigatorBar残したまま遷移'),
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.of(context).push<Widget>(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ),
                );
              },
            ),
            FlatButton(
              child: const Text('フルスクリーン'),
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
