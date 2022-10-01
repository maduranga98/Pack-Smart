// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Show_Items extends StatefulWidget {
  String event;
  Show_Items({Key? key, required this.event});

  @override
  State<Show_Items> createState() => _Show_ItemsState(event: event);
}

class _Show_ItemsState extends State<Show_Items> {
  String event;
  _Show_ItemsState({required this.event});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 124, 113),
      appBar: AppBar(
        title: const Text("Add Items"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 110, 124, 113),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("User")
              .doc(uid)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                    color: Color.fromARGB(255, 210, 194, 174),
                    shadowColor: Color.fromARGB(255, 210, 194, 174),
                    child: ListTile(
                      title: Text(e['item']),
                      trailing: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("User")
                                .doc(uid)
                                .collection("Event_Items")
                                .doc(event)
                                .collection("items")
                                .doc()
                                .set({'item': e['item']});
                            Fluttertoast.showToast(
                                msg: "Item added to the list",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          icon: const Icon(Icons.add)),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
