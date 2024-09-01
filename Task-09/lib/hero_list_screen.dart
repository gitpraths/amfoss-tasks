import 'package:flutter/material.dart';
import 'hero.dart';
import 'hero_detail_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HeroListScreen extends StatefulWidget {
  @override
  _HeroListScreenState createState() => _HeroListScreenState();
}

class _HeroListScreenState extends State<HeroListScreen> {
  List<SuperHero> heroes = [];
  List<SuperHero> filteredHeroes = [];
  String searchQuery = ''; // Declare searchQuery here

  @override
  void initState() {
    super.initState();
    loadHeroes();
  }

  Future<void> loadHeroes() async {
    try {
      final String response = await rootBundle.loadString('assets/heroes.json');
      final List<dynamic> data = json.decode(response);
      heroes = data.map((json) => SuperHero.fromJson(json)).toList();
      print("Total Heroes Loaded: ${heroes.length}");
      filteredHeroes = heroes;
      setState(() {});
    } catch (e) {
      print("Error loading heroes: $e");
    }
  }

  void filterHeroes(String query) {
    final results = heroes.where((hero) {
      return hero.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    print("Filtered Heroes Count: ${results.length}"); // Debugging output

    setState(() {
      filteredHeroes = results;
      searchQuery = query; // Set searchQuery variable
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Superhero Encyclopaedia'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterHeroes,
              decoration: InputDecoration(
                hintText: 'Search Heroes',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredHeroes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredHeroes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HeroDetailScreen(hero: filteredHeroes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
