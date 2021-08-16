import 'dart:async';

import 'package:movie_list/db/dbhelper.dart';
import 'package:movie_list/models/movie.dart';

class MovieProvider {
  static final MovieProvider instance = MovieProvider();
  List<Movie> movies = [];

  StreamController<List<Movie>> _streamController =
      StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get moviesStream {
    return _streamController.stream;
  }

  getMovies() async {
    movies = await DBhelper.instance.getMovies();
    _streamController.add(movies);
  }

  addMovie(Movie movie) async {
    await DBhelper.instance.insert(movie);
    await getMovies();
  }

  updateMovies(Movie movie) async {
    await DBhelper.instance.update(movie);
    await getMovies();
  }

  deleteMovie(Movie movie) async {
    await DBhelper.instance.delete(movie);
    await getMovies();
  }
}
