import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

class HomeViewModel extends ChangeNotifier {

  final MovieRepository repository = MovieRepository();

  late List<MovieModel> movies;

  HomeViewModel() {
    loadMovies();
  }

  void loadMovies() {
    movies = repository.getMovies();
    notifyListeners();
  }
}