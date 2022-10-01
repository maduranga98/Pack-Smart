// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smbp/HomePage.dart';
import 'package:smbp/Login%20Pages/loginPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 34, 32),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _userLoginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0, bottom: 50.0),
                      child: Text(
                        "Welcome to Pack Smart",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 210, 194, 174)),
                      ),
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226)),
                      keyboardType: TextInputType.name,
                      cursorColor: Color.fromARGB(255, 232, 231, 226),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        labelText: 'UserName',
                        hintText: 'UserName',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 232, 231, 226),
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 232, 231, 226),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: username,
                      validator: (value) =>
                          value!.isEmpty ? 'UserName cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226)),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color.fromARGB(255, 232, 231, 226),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        labelText: 'Email',
                        hintText: 'Email',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 232, 231, 226),
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 232, 231, 226),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: email,
                      validator: (value) =>
                          value!.isEmpty ? 'Email cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226)),
                      keyboardType: TextInputType.name,
                      cursorColor: Color.fromARGB(255, 232, 231, 226),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        labelText: 'Password',
                        hintText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 14.0,
                        ),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 232, 231, 226),
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 232, 231, 226),
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 232, 231, 226),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: password,
                      validator: (value) =>
                          value!.isEmpty ? 'Password cannot be blank' : null,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                        color: Color.fromARGB(255, 110, 124, 113),
                        onPressed: () async {
                          if (_userLoginFormKey.currentState!.validate()) {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final User? user = auth.currentUser;
                            FirebaseFirestore.instance
                                .collection("User")
                                .doc()
                                .set({
                              'Username': username.text.trim(),
                              'Password': password.text.trim(),
                              'email': email.text.trim(),
                            });
                            Fluttertoast.showToast(
                                msg: "Welcome to Pack Smart",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 210, 194, 174)),
                        ))
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 232, 231, 226),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage())),
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                        color: Color.fromARGB(255, 210, 194, 174),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ],
        )),
      )),
    );
  }
}
