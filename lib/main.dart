import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const Pokodex());
}

class Pokodex extends StatelessWidget {
  const Pokodex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
