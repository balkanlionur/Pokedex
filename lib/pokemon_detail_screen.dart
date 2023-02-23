import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  dynamic pokemonDetail;
  final Color color;
  final int heroTag;

  PokemonDetailScreen(
      {super.key,
      dynamic this.pokemonDetail,
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
            top: 30,
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
              top: 70,
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
            top: mediaHeight * 0.12,
            right: -60,
            child: Image.asset(
              ProjectImage().pokeball,
              height: 220,
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
                      height: 20,
                    ),
                    detailData(mediaWidth, 'Name', 'name'),
                    detailData(mediaWidth, 'Height', 'height'),
                    detailData(mediaWidth, 'Weight', 'weight'),
                    detailData(mediaWidth, 'Spawn Time', 'spawn_time'),
                    detailData(mediaWidth, 'Weakness', 'weaknesses'),
                    detailData(mediaWidth, 'Pre Form', 'prev_evolution'),
                    detailData(mediaWidth, 'Evolution', 'next_evolution'),
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

  Padding detailData(double mediaWidth, String text, dynamic data) {
    var onur;
    String maxed;
    if (data != 'weaknesses') {
      onur = widget.pokemonDetail[data];
    } else {
      onur = widget.pokemonDetail[data].join(', ');
    }

    if (data == 'next_evolution' || data == 'prev_evolution') {
      data == 'next_evolution' ? maxed = 'Maxed Out' : maxed = 'Just Hatched';
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: mediaWidth * 0.3, child: textss(text, false)),
              widget.pokemonDetail[data] != null
                  ? SizedBox(
                      height: 20,
                      width: mediaWidth * 0.50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.pokemonDetail[data].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: textss(
                                widget.pokemonDetail[data][index]['name'],
                                true),
                          );
                        },
                      ))
                  : textss(maxed, true),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: mediaWidth * 0.3, child: textss(text, false)),
              Container(child: textss(onur, true)),
            ],
          ),
        ),
      );
    }
  }

  Text textss(String text, bool isbold) {
    var stylex;
    isbold == true
        ? stylex = const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
        : stylex = const TextStyle(color: Colors.blueGrey, fontSize: 15);
    return Text(
      text,
      style: stylex,
    );
  }
}

class ProjectImage {
  final pokeball = 'asset/pokeball.png';
}
