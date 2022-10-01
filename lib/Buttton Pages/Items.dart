// ignore_for_file: implementation_imports, file_names, unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  TextEditingController item = TextEditingController();
  TextEditingController quantity = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 34, 32),
      appBar: AppBar(
        title: Text("Items"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 110, 124, 113),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(uid)
            .collection("items")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              children: snapshot.data!.docs.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Color.fromARGB(255, 210, 194, 174),
                    shadowColor: Color.fromARGB(255, 210, 194, 174),
                    child: ListTile(
                      title: Text(
                        e['item'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        e['quantity'],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      onLongPress: (() {
                        FirebaseFirestore.instance
                            .collection("User")
                            .doc(uid)
                            .collection("items")
                            .doc(e.id)
                            .delete();
                        Fluttertoast.showToast(
                            msg: "Item delete from the list",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 110, 124, 113),
          onPressed: (() => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 24, 53, 38),
                  title: Center(
                      child: const Text(
                    'Add Your Item',
                    style: TextStyle(color: Color.fromARGB(255, 193, 211, 47)),
                  )),
                  content: Container(
                    height: 130.0,
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
                                labelText: 'Item name',
                                hintText: 'Item name',
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
                              controller: item,
                              validator: (value) => value!.isEmpty
                                  ? 'Item cannot be blank'
                                  : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Quantity',
                                hintText: 'Quantity',
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
                                  Icons.class_outlined,
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
                              controller: quantity,
                              validator: (value) => value!.isEmpty
                                  ? 'Quantity cannot be blank'
                                  : null,
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
                              .collection("items")
                              .doc()
                              .set({
                            'item': item.text.trim(),
                            'quantity': quantity.text.trim()
                          });
                          Fluttertoast.showToast(
                              msg: "Item added to the list",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pop(context);
                          item.clear();
                          quantity.clear();
                        }
                      },
                      child: Text('ACCEPT'),
                    ),
                  ],
                );
              })),
          child: Icon(Icons.add_box)),
    );
  }
}
