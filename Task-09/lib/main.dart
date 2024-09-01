import 'package:flutter/material.dart';
import 'hero_list_screen.dart';

void main() {
  runApp(HeroEncyclopaediaApp());
}

class HeroEncyclopaediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superhero Encyclopaedia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HeroListScreen(),
    );
  }
}
