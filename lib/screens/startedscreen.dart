import 'package:flutter/material.dart';
import 'package:test_1/auth/login.dart';
import 'package:test_1/auth/register.dart';

class Startedscreen extends StatelessWidget {
  const Startedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            filterQuality: FilterQuality.medium,
            fit: BoxFit.fill,
            image: AssetImage("asset/images/thebestimage.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 31),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Plant",
                      style: TextStyle(
                          color: Color.fromARGB(255, 42, 109, 44),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Pal",
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 172, 39),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text("Your personal",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              const Text("plant Care Helper",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 220),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Signin(),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(144, 157, 157, 157)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  Signup(),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
