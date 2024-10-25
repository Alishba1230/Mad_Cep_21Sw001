import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/view/login/sign_In.dart';
import 'package:bookstore_mad_project/view/login/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/background.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              width: media.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.72,
                  ),
                  RoundButton(
                      title: "Sign In",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  RoundButton(
                      title: "Sign Up",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
