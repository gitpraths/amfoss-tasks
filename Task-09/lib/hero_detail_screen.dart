import 'package:flutter/material.dart';
import 'hero.dart';

class HeroDetailScreen extends StatelessWidget {
  final SuperHero hero;

  const HeroDetailScreen({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(hero.images.md),
            SizedBox(height: 10),
            Text(
              hero.biography.fullName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Strength: ${hero.powerstats.strength.toString()}'),
            Text('Intelligence: ${hero.powerstats.intelligence.toString()}'),
            Text('First Appearance: ${hero.biography.firstAppearance}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
