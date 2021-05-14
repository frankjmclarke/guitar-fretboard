import 'package:flutter/material.dart';
import 'package:fmvvm_app/viewModel/movieViewModel.dart';

import 'service/webservice.dart';
class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];
  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}