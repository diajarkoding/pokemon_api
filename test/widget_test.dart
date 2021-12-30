import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  await getPokemon();
}

Future<Map<String, dynamic>?> getPokemon() async {
  final Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
  var response = await http.get(url);
  if (response.statusCode != 200) {
    print(response.statusCode);
    return null;
  } else {
    var data = (json.decode(response.body) as Map<String, dynamic>)['results'];
    print(data[1]['name']);
    return data[0];
  }
}
