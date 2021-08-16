import 'package:flutter/material.dart';
import 'package:movie_list/components/moviecard.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/services/movieProvider.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  void initState() {
    MovieProvider.instance.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<List<Movie>>(context);
    // ignore: unnecessary_null_comparison
    return (movies == null)
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      height: 10,
                      endIndent: 12,
                      indent: 12,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movies[index],
                    );
                  }),
            ),
          );
  }
}
