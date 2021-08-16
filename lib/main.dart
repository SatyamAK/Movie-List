import 'package:flutter/material.dart';
import 'package:movie_list/screens/homescreen/home.dart';
import 'package:movie_list/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme(),
        //darkTheme: darkTheme(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
