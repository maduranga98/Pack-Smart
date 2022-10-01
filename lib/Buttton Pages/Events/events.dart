// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smbp/Buttton%20Pages/Events/event_items.dart';

class Events extends StatefulWidget {
  String uid;

  Events({Key? key, required this.uid});

  @override
  State<Events> createState() => _EventsState(uid: uid);
}

class _EventsState extends State<Events> {
  String uid;
  _EventsState({required this.uid});
  TextEditingController item = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController event = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 34, 32),
      appBar: AppBar(
        title: Text("Events"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 110, 124, 113),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(uid)
            .collection("events")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
                children: snapshot.data!.docs.map((e) {
              return Card(
                color: Color.fromARGB(255, 210, 194, 174),
                shadowColor: Color.fromARGB(255, 210, 194, 174),
                child: ListTile(
                  textColor: Colors.white,
                  tileColor: Colors.blueAccent[800],
                  title: Text(
                    e['event'],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.add,
                  ),
                  onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventItems(
                                event: e['event'],
                              )))),
                ),
              );
            }).toList());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 110, 124, 113),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 24, 53, 38),
                title: Center(
                    child: const Text(
                  'Add Your Event',
                  style: TextStyle(color: Color.fromARGB(255, 193, 211, 47)),
                )),
                // ignore: sized_box_for_whitespace
                content: Container(
                  height: 65.0,
                  child: Form(
                    key: _FormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.grey),
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0.0),
                              labelText: 'Event',
                              hintText: 'Event',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              prefixIcon: const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.grey,
                                size: 18,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              floatingLabelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            controller: event,
                            validator: (value) =>
                                value!.isEmpty ? 'Event cannot be blank' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 3, 121, 62)),
                    onPressed: () {
                      if (_FormKey.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection("User")
                            .doc(uid)
                            .collection("events")
                            .doc()
                            .set({
                          'event': event.text.trim(),
                        });
                        Navigator.pop(context);
                        event.clear();
                      }
                    },
                    child: Text('ADD'),
                  ),
                ],
              );
            }),
        child: Icon(Icons.add),
      ),
    );
  }
}
