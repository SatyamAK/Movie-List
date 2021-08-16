import 'package:flutter/material.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/screens/homescreen/moviesList.dart';
import 'package:movie_list/screens/homescreen/registermovie.dart';
import 'package:provider/provider.dart';
import 'package:movie_list/services/movieProvider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Movie>>.value(
      value: MovieProvider.instance.moviesStream,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies List'),
          actions: [TextButton(onPressed: () {}, child: Text('Logout'))],
        ),
        body: MovieListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddMovieList()));
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}
