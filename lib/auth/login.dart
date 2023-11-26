import 'package:flutter/material.dart';
import 'package:test_1/auth/register.dart';
import 'package:test_1/screens/homescreen.dart';
import 'package:test_1/shared/constant.dart';
import 'package:test_1/shared/my_textfield.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 240, left: 40, right: 40),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green[100],
          //   image: DecorationImage(
          //       opacity: 0.8,
          //       image: AssetImage("asset/images/welcome.jpg"),
          //       fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               MYtextfield(
                textinputtype: TextInputType.emailAddress,
                ispassword: false,
                hinttext: "Enter Your Email :",
                mycontroller: email,
              ),
              const SizedBox(
                height: 25,
              ),
               MYtextfield(
                textinputtype: TextInputType.text,
                ispassword: true,
                hinttext: "Enter Your password :",
                mycontroller: password,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(bc)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ));
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don not have an account?",
                    style: TextStyle(fontSize: 13),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Signup(),
                          ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
