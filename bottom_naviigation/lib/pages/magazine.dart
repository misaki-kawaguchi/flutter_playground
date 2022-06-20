import 'package:flutter/material.dart';

class Magazine extends StatelessWidget {
  const Magazine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAGAZINE'),
      ),
      body: const Center(
        child: Text('MAGAZINEページ'),
      ),
    );
  }
}
