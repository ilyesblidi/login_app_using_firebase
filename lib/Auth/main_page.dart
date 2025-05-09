import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app_using_firebase/Auth/auth_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges() ,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(snapshot.hasError){
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if(snapshot.hasData){
              return const HomePage();
            } else {
              return AuthPage();
            }
          }
      ),
    );
  }
}
