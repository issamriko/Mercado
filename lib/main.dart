// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_1/auth/login.dart';
import 'package:test_1/provider/cart.dart';
import 'package:provider/provider.dart';
import 'package:test_1/screens/homescreen.dart';


void main() async {
  // 3.3.15 version bach ymchi
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

@override
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        title: "store",
        debugShowCheckedModeBanner: false,
        home:
            FirebaseAuth.instance.currentUser == null ? Signin() : Homescreen(),
      ),
    );
  }
}
