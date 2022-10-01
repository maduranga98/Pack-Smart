// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, no_logic_in_create_state

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smbp/Buttton%20Pages/Events/show_items.dart';

class EventItems extends StatefulWidget {
  String event;
  EventItems({Key? key, required this.event});

  @override
  State<EventItems> createState() => _EventItemsState(event: event);
}

class _EventItemsState extends State<EventItems> {
  String event;
  _EventItemsState({required this.event});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 34, 32),
      appBar: AppBar(
        title: Text(event),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 110, 124, 113),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(uid)
            .collection("Event_Items")
            .doc(event)
            .collection("items")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: snapshot.data!.docs.map((e) {
                return Card(
                  color: Color.fromARGB(255, 210, 194, 174),
                  shadowColor: Color.fromARGB(255, 210, 194, 174),
                  child: ListTile(
                    tileColor: Colors.amber,
                    title: Text(e['item']),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 110, 124, 113),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Show_Items(
                      event: event,
                    ))),
        child: const Icon(Icons.ad_units),
      ),
    );
  }
}
