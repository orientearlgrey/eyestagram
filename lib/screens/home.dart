import 'package:eyestagram/components/post.dart';
import 'package:flutter/material.dart';

import 'package:eyestagram/components/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> posts = [
      for (var i = 0; i < 100; i++) EyestagramPost(current: i)
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          children: <Widget>[
            const EyestagramMenu(),
            SizedBox(
              width: 1688,
              child: ListView(
                children: posts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
