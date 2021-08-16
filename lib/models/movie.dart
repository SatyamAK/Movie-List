import 'package:movie_list/db/dbhelper.dart';

class Movie {
  int? id;
  String? name;
  String? director;
  String? cover;

  Movie();

  Movie.fromMap(Map<String, dynamic> map) {
    this.id = map[DBhelper.ID];
    this.name = map[DBhelper.NAME];
    this.director = map[DBhelper.DIRECTOR];
    this.cover = map[DBhelper.COVER];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DBhelper.NAME: this.name,
      DBhelper.DIRECTOR: this.director,
      DBhelper.COVER: this.cover
    };
    if (id != null) {
      map[DBhelper.ID] = this.id;
    }
    return map;
  }
}
