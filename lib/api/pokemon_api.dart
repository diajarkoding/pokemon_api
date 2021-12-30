import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_api/model/pokemon_detail.dart';
import 'package:pokemon_api/model/pokemon_summary.dart';

class PokemonApi {
  Future<PokemonIndex> fetchPokemon() async {
    final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    final response = await http.get(url);
    final data = PokemonIndex.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Terjadi kesalahan');
    }
  }

  Future<PokemonDetail> fetchDetailPokemon(url) async {
    final Uri halaman = Uri.parse(url);
    final response = await http.get(halaman);
    var data = PokemonDetail.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Terjadi kesalahan');
    }
  }
}
