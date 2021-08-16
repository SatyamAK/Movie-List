import 'package:flutter/material.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/services/movieProvider.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.wired.com/photos/5d09594a62bcb0c9752779d9/1:1/w_1500,h_1500,c_limit/Transpo_G70_TA-518126.jpg'),
                  fit: BoxFit.cover)),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie!.name.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                //SizedBox(height: 6),
                Text(
                  movie!.director.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12, left: 12),
              child: InkWell(
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    Container(
                        margin: EdgeInsets.only(left: 4), child: Text('Edit'))
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            Container(
              margin: EdgeInsets.only(right: 12, left: 12),
              child: InkWell(
                onTap: () {
                  //MovieProvider.instance.deleteMovie(movie!);
                  print(movie!.id.toString());
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    Container(
                        margin: EdgeInsets.only(left: 4), child: Text('Delete'))
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
