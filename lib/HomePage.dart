// ignore_for_file: avoid_unnecessary_containers, file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smbp/Buttton%20Pages/Items.dart';
import 'package:smbp/Buttton%20Pages/Events/events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 34, 32),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 110, 124, 113),
        title: const Text(
          "Pack Smart",
          style: TextStyle(
              color: Color.fromARGB(255, 210, 194, 174),
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 200.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                      textStyle: TextStyle(
                          fontWeight: FontWeight
                              .bold), //specify the button's text TextStyle
                      padding: const EdgeInsets.only(
                          top: 4.0,
                          bottom: 4.0,
                          right: 8.0,
                          left: 8.0), //specify the button's Padding
                      minimumSize: Size(150,
                          60), //specify the button's first: width and second: height
                      side: BorderSide(
                          color: Colors.yellow,
                          width: 2.0,
                          style: BorderStyle.solid), //set border for the button
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0)),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Events(
                                  uid: uid.toString(),
                                ))),
                    child: const Text("Events"),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        textStyle: TextStyle(
                            fontWeight: FontWeight
                                .bold), //specify the button's text TextStyle
                        padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                            left: 8.0), //specify the button's Padding
                        minimumSize: Size(150,
                            60), //specify the button's first: width and second: height
                        side: BorderSide(
                            color: Colors.yellow,
                            width: 2.0,
                            style:
                                BorderStyle.solid), //set border for the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Items())),
                      child: const Text("Items")),
                ],
              ),
            ),
            //line 2

            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        textStyle: TextStyle(
                            fontWeight: FontWeight
                                .bold), //specify the button's text TextStyle
                        padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                            left: 8.0), //specify the button's Padding
                        minimumSize: Size(150,
                            60), //specify the button's first: width and second: height
                        side: BorderSide(
                            color: Colors.yellow,
                            width: 2.0,
                            style:
                                BorderStyle.solid), //set border for the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                      ),
                      onPressed: () {},
                      child: const Text("Check List")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        textStyle: TextStyle(
                            fontWeight: FontWeight
                                .bold), //specify the button's text TextStyle
                        padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                            left: 8.0), //specify the button's Padding
                        minimumSize: Size(150,
                            60), //specify the button's first: width and second: height
                        side: BorderSide(
                            color: Colors.yellow,
                            width: 2.0,
                            style:
                                BorderStyle.solid), //set border for the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                      ),
                      onPressed: () {},
                      child: const Text("Schedule")),
                ],
              ),
            ),
            // line 3
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        textStyle: TextStyle(
                            fontWeight: FontWeight
                                .bold), //specify the button's text TextStyle
                        padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                            left: 8.0), //specify the button's Padding
                        minimumSize: Size(150,
                            60), //specify the button's first: width and second: height
                        side: BorderSide(
                            color: Colors.yellow,
                            width: 2.0,
                            style:
                                BorderStyle.solid), //set border for the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                      ),
                      onPressed: () {},
                      child: const Text("Notes")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        textStyle: TextStyle(
                            fontWeight: FontWeight
                                .bold), //specify the button's text TextStyle
                        padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                            left: 8.0), //specify the button's Padding
                        minimumSize: Size(150,
                            60), //specify the button's first: width and second: height
                        side: BorderSide(
                            color: Colors.yellow,
                            width: 2.0,
                            style:
                                BorderStyle.solid), //set border for the button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0)),
                      ),
                      onPressed: () {},
                      child: const Text("Rapid Packing")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
