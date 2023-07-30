import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/Pages/AuthDemo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matrimony_app/Pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthDemo();
            }
          }),
        ));
  }
}
