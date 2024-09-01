import 'package:flutter/material.dart';
import 'hero.dart';

class FavoritesScreen extends StatelessWidget {
  final List<SuperHero> favoriteHeroes;

  const FavoritesScreen({Key? key, required this.favoriteHeroes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Heroes'),
      ),
      body: ListView.builder(
        itemCount: favoriteHeroes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteHeroes[index].name),
            onTap: () {
              // Navigate to hero detail if needed
            },
          );
        },
      ),
    );
  }
}
