import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen(
      {super.key,
      required this.pokemonDetail,
      required this.color,
      required this.heroTag});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.pokemonDetail['name'],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Positioned(
              top: 120,
              left: 20,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Text(
                    widget.pokemonDetail['type'].join(', '),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          Positioned(
            top: mediaHeight * 0.18,
            right: -60,
            child: Image.asset(
              'asset/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: mediaWidth,
              height: mediaHeight * 0.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              )),
                          Container(
                              child: Text(
                            widget.pokemonDetail['name'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Height',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              )),
                          Container(
                              child: Text(
                            widget.pokemonDetail['height'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Weight',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              )),
                          Container(
                              child: Text(
                            widget.pokemonDetail['weight'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Spawn Time',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              )),
                          Container(
                              child: Text(
                            widget.pokemonDetail['spawn_time'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Weakness',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              )),
                          Container(
                              child: Text(
                            widget.pokemonDetail['weaknesses'].join(', '),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Pre Form',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16),
                              )),
                          widget.pokemonDetail['prev_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: mediaWidth * 0.50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget
                                        .pokemonDetail['prev_evolution'].length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          widget.pokemonDetail['prev_evolution']
                                              [index]['name'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  ))
                              : const Text(
                                  'Just Hatched',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: mediaWidth * 0.3,
                              child: const Text(
                                'Evolution',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16),
                              )),
                          widget.pokemonDetail['next_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: mediaWidth * 0.50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget
                                        .pokemonDetail['next_evolution'].length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Text(
                                          widget.pokemonDetail['next_evolution']
                                              [index]['name'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  ))
                              : const Text(
                                  'Maxed Out',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: mediaHeight * 0.17,
            left: mediaWidth / 4,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
