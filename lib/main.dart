import 'package:eyestagram/screens/eyestagram_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EyestagramApp());
}

class EyestagramApp extends StatelessWidget {
  const EyestagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.light(),
      home: const EyestagramPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
