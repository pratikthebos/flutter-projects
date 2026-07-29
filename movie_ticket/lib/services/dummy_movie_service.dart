import '../models/movie_model.dart';

class DummyMovieService {
  DummyMovieService._();

  static List<MovieModel> movies = [

    MovieModel(
      title: "Spider-Man: Brand New Day",
      poster: "assets/posters/spiderman.jpg",
      genre: "Action • Adventure",
      duration: "2h 32m",
      rating: "9.2",
      language: "English",
    ),

    MovieModel(
      title: "Avengers: Doomsday",
      poster: "assets/posters/avengers_doomsday.jpg",
      genre: "Action • Sci-Fi",
      duration: "3h 05m",
      rating: "9.7",
      language: "English",
    ),

    MovieModel(
      title: "Black Panther 3",
      poster: "assets/posters/black_panther3.jpg",
      genre: "Action • Fantasy",
      duration: "2h 28m",
      rating: "9.0",
      language: "English",
    ),

    MovieModel(
      title: "Avengers: Secret Wars",
      poster: "assets/posters/secret_wars.jpg",
      genre: "Adventure • Sci-Fi",
      duration: "3h 12m",
      rating: "9.9",
      language: "English",
    ),

    MovieModel(
      title: "Ghost Rider",
      poster: "assets/posters/ghost_rider.jpg",
      genre: "Action • Supernatural",
      duration: "2h 20m",
      rating: "8.8",
      language: "English",
    ),
  ];
}