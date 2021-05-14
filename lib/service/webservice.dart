import 'dart:convert';
import 'package:fmvvm_app/movie.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final str =
        "http://www.omdbapi.com/?apikey=efd0b339&s=$keyword&r=json"; //r=xml
    Uri url = Uri.parse(str);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String str = response.body;
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
