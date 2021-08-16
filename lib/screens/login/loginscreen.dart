import 'package:flutter/material.dart';
import 'package:movie_list/services/authService.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 64),),
              SizedBox(height: 14,),
              ElevatedButton(
                onPressed: ()async {
                  await AuthService().login();
                },
                child: Text(
                  'SignIn Using Google',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 9),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
