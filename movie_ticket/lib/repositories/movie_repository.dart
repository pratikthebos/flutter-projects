import '../models/movie_model.dart';
import '../services/dummy_movie_service.dart';

class MovieRepository {

  List<MovieModel> getMovies() {
    return DummyMovieService.movies;
  }

}