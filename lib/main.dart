import 'package:firebase_core/firebase_core.dart';
import 'package:first_app_using_firebase/login_page.dart';
import 'package:first_app_using_firebase/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(apiKey: "AIzaSyDQRtxT2WutIoCgr7ZYVBmAucIasaQRP_g",
            authDomain: "first-project-with-fireb-2a707.firebaseapp.com",
            projectId: "first-project-with-fireb-2a707",
            storageBucket: "first-project-with-fireb-2a707.firebasestorage.app",
            messagingSenderId: "31913769992",
            appId: "1:31913769992:web:9dec2a0057ea577410a5bd")
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
// class MyApp extends StatelessWidget {