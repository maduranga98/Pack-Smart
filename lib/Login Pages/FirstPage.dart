// ignore_for_file: unnecessary_const, file_names, prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smbp/HomePage.dart';
import 'package:smbp/Login%20Pages/loginPage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 34, 32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Center(
                  child: Image.asset('assets/img1.gif'),
                ),
              ),
            ),
            Center(
                child: SizedBox(
              child: Shimmer.fromColors(
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Pack Smart',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  baseColor: Color.fromARGB(255, 110, 124, 113),
                  highlightColor: Color.fromARGB(255, 232, 231, 226)),
            )),
            const SizedBox(
              height: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
