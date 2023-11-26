// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_1/auth/login.dart';
import 'package:test_1/screens/homescreen.dart';
import 'package:test_1/shared/constant.dart';
import 'package:test_1/shared/my_textfield.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.green[100]),
        alignment: Alignment.center,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("asset/images/register.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Create",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Account",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 60),
                MYtextfield(
                    textinputtype: TextInputType.emailAddress,
                    ispassword: false,
                    hinttext: "Enter Your User Name :",
                    mycontroller: name),
                const SizedBox(height: 25),
                MYtextfield(
                    textinputtype: TextInputType.emailAddress,
                    ispassword: false,
                    hinttext: "Enter Your Email :",
                    mycontroller: email),
                const SizedBox(height: 25),
                MYtextfield(
                    textinputtype: TextInputType.text,
                    ispassword: true,
                    hinttext: "Enter Your password :",
                    mycontroller: password),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      backgroundColor: MaterialStatePropertyAll(bc)),
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password.text,
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homescreen(),
                          ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 13),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signin(),
                            ));
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
