import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/screens/homescreen/home.dart';
import 'package:movie_list/screens/login/loginscreen.dart';
import 'package:movie_list/services/authService.dart';
import 'package:movie_list/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        initialData: null,
        value: AuthService().firebaseAuth.authStateChanges(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme(),
            //darkTheme: darkTheme(),
            debugShowCheckedModeBanner: false,
            home: Wrapper()
      )
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);
    if (user == null) {
      return LoginScreen();
    }
    return HomeScreen();
  }
}
