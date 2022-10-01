// ignore_for_file: prefer_const_constructors, file_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smbp/HomePage.dart';
import 'package:smbp/Login%20Pages/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
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
                        "Pack Smart",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 210, 194, 174)),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 250.0,
                    // ),
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
                          value!.isEmpty ? 'Email cannot be blank' : null,
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
                        onPressed: () {
                          if (_userLoginFormKey.currentState!.validate()) {
                            final credential = FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: username.text.trim(),
                                    password: password.text.trim());
                            Fluttertoast.showToast(
                                msg: "Welcome Back to Pack Smart",
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
                          "Sign In",
                          style: TextStyle(
                              color: Color.fromARGB(255, 210, 194, 174)),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 232, 231, 226),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp())),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: Color.fromARGB(255, 210, 194, 174),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ],
                ))
          ],
        )),
      )),
    );
  }
}
