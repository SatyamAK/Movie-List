import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:movie_list/models/movie.dart';

class DBhelper {
  static final DBhelper instance = DBhelper._init();
  DBhelper._init();
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String DIRECTOR = 'director';
  static const String COVER = 'cover';
  static const String TABLENAME = 'MoviesTable';
  static const String DBNAME = 'MoviesDB';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBNAME);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLENAME(
        $ID 'INTEGER PRIMARY KEY AUTOINCREMENT',
        $NAME 'TEXT NOT NULL',
        $DIRECTOR 'TEXTNOT NULL',
        $COVER 'TEXT NOT NULL'
        )
    ''');
  }

  Future<List<Movie>> getMovies() async {
    final database = await DBhelper.instance.db;
    var movies =
        await database.query(TABLENAME, columns: [ID, NAME, DIRECTOR, COVER]);
    List<Movie> moviesLst = [];
    movies.forEach((element) {
      Movie m = Movie.fromMap(element);
      moviesLst.add(m);
    });
    return moviesLst;
  }

  Future close() async {
    final database = await DBhelper.instance.db;
    await database.close();
  }

  Future insert(Movie movie) async {
    final database = await DBhelper.instance.db;
    database.insert(
      TABLENAME,
      movie.toMap(),
    );
  }

  Future update(Movie movie) async {
    final database = await DBhelper.instance.db;
    database.update(TABLENAME, movie.toMap(),
        where: '$ID = ?', whereArgs: [movie.id]);
  }

  Future delete(Movie movie) async {
    final database = await DBhelper.instance.db;
    database.delete(TABLENAME, where: '$ID = ?', whereArgs: [movie.id]);
  }
}
