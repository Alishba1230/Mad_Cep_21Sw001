import 'package:bookstore_mad_project/auth_service.dart';
import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/commonWidget/round_textfield.dart';
import 'package:bookstore_mad_project/view/login/help_us.dart';
import 'package:bookstore_mad_project/view/main_tab/main_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignInState();
}

class _SignInState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txt = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isStay = false;
  AuthService authService = AuthService();
  signUp() {
    if (_formKey.currentState!.validate()) {
      authService.signUp(email.text, password.text).then((user) {
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
                "Sign Up",
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
                          hintText: "First & Last Name",
                          controller: txt,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundTextfield(
                          hintText: "Email Address",
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundTextfield(
                          hintText: "Mobile Phone",
                          controller: mobile,
                          keyboardType: TextInputType.phone,
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
                              "Please sign me up for Monthly Newspaper",
                              style: TextStyle(
                                color: PColor.subtitle.withOpacity(0.3),
                                fontSize: 13,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        RoundLineButton(
                          title: "Sign Up",
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const HelpScreen()));
                            signUp();
                            password.clear();
                            email.clear();
                            mobile.clear();
                            txt.clear();
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
