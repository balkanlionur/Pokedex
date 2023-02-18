import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  List pokedex = [];

  @override
  void initState() {
    super.initState();

    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black87,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )),
        title: const Text(
          'Pokedex',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white38,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'asset/pokeball.png',
                width: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
            top: 150,
            bottom: 0,
            width: mediaWidth,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: type == 'Grass'
                                          ? Colors.greenAccent
                                          : type == 'Fire'
                                              ? Colors.redAccent
                                              : type == 'Water'
                                                  ? Colors.blueAccent
                                                  : type == 'Electric'
                                                      ? Colors.yellowAccent
                                                      : type == 'Rock'
                                                          ? Colors.grey
                                                          : type == 'Ground'
                                                              ? Colors.brown
                                                              : type ==
                                                                      'Psychic'
                                                                  ? Colors
                                                                      .indigo
                                                                  : type ==
                                                                          'Fighting'
                                                                      ? Colors
                                                                          .orange
                                                                      : type ==
                                                                              'Bug'
                                                                          ? Colors
                                                                              .lightGreenAccent
                                                                          : type == 'Ghost'
                                                                              ? Colors.deepPurple
                                                                              : type == 'Normal'
                                                                                  ? Colors.black26
                                                                                  : type == 'Poison'
                                                                                      ? Colors.deepPurpleAccent
                                                                                      : Colors.pink,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: -10,
                                        right: -10,
                                        child: Image.asset(
                                          'asset/pokeball.png',
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                          top: 20,
                                          left: 20,
                                          child: Text(
                                            pokedex[index]['name'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                      Positioned(
                                        top: 45,
                                        left: 20,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              type.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Hero(
                                          tag: index,
                                          child: CachedNetworkImage(
                                            imageUrl: pokedex[index]['img'],
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                //To do Navigate to new detail screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PokemonDetailScreen(
                                              pokemonDetail: pokedex[index],
                                              color: type == 'Grass'
                                                  ? Colors.greenAccent
                                                  : type == 'Fire'
                                                      ? Colors.redAccent
                                                      : type == 'Water'
                                                          ? Colors.blueAccent
                                                          : type == 'Electric'
                                                              ? Colors
                                                                  .yellowAccent
                                                              : type == 'Rock'
                                                                  ? Colors.grey
                                                                  : type ==
                                                                          'Ground'
                                                                      ? Colors
                                                                          .brown
                                                                      : type ==
                                                                              'Psychic'
                                                                          ? Colors
                                                                              .indigo
                                                                          : type == 'Fighting'
                                                                              ? Colors.orange
                                                                              : type == 'Bug'
                                                                                  ? Colors.lightGreenAccent
                                                                                  : type == 'Ghost'
                                                                                      ? Colors.deepPurple
                                                                                      : type == 'Normal'
                                                                                          ? Colors.black26
                                                                                          : type == 'Poison'
                                                                                              ? Colors.deepPurpleAccent
                                                                                              : Colors.pink,
                                              heroTag: index,
                                            )));
                              },
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: LinearProgressIndicator(),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.http('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);

        pokedex = decodedJsonData['pokemon'];

        setState(() {});
      }
    });
  }
}
