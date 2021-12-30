import 'package:flutter/material.dart';
import 'package:pokemon_api/api/pokemon_api.dart';
import 'package:pokemon_api/extensions/extension_capitalize.dart';
import 'package:pokemon_api/model/pokemon_detail.dart';

class PokemonDetailPage extends StatefulWidget {
  final String url;
  const PokemonDetailPage({Key? key, required this.url}) : super(key: key);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetailPage> {
  Future<PokemonDetail>? pokemonIndex;

  @override
  void initState() {
    super.initState();
    pokemonIndex = PokemonApi().fetchDetailPokemon(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDetail>(
      future: pokemonIndex,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData) {
            // data
            final name = snapshot.data!.name;
            final weight = snapshot.data!.weight;
            final gambar2 = snapshot.data!.sprites!.backDefault;
            final gambar1 = snapshot.data!.sprites!.frontDefault;
            return Scaffold(
              appBar: AppBar(
                title: Text('Pokemon ' + '$name'.capitalize()),
              ),
              body: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name : ' + '$name'.capitalize(),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                    Image.network(
                      '$gambar1',
                      width: 200,
                      height: 200,
                    ),
                    Image.network(
                      '$gambar2',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Weight : $weight',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // eror
            return const Scaffold(
              body: Center(
                child: Text('Tidak ada data'),
              ),
            );
          }
        }
      },
    );
  }
}
