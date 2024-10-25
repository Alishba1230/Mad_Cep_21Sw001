import 'package:bookstore_mad_project/auth_service.dart';
import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/commonWidget/round_textfield.dart';
import 'package:bookstore_mad_project/view/home/home.dart';
import 'package:bookstore_mad_project/view/login/forgot_password.dart';
import 'package:bookstore_mad_project/view/main_tab/main_tab.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txt = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isStay = false;
  AuthService authService = AuthService();
  signIn() {
    if (_formKey.currentState!.validate()) {
      authService.signIn(email.text, password.text).then((user) {
        if (user != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MainTabScreen(),
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.backG,
      appBar: AppBar(
        backgroundColor: PColor.backG,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                    color: PColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RoundTextfield(
                          hintText: "Email Address",
                          controller: email,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundTextfield(
                          hintText: "Password",
                          controller: password,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isStay = !isStay;
                                });
                              },
                              icon: Icon(
                                isStay
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: isStay
                                    ? PColor.primaryPink
                                    : PColor.subtitle.withOpacity(0.3),
                              ),
                            ),
                            Text(
                              "Stay Logged In",
                              style: TextStyle(
                                color: PColor.subtitle.withOpacity(0.3),
                                fontSize: 15,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: PColor.subtitle.withOpacity(0.3),
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        RoundLineButton(
                          title: "Sign In",
                          onPressed: () {
                            signIn();
                            email.clear();
                            password.clear();
                          },
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
