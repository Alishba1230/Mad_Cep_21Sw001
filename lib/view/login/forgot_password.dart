import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/commonWidget/round_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  bool isStay = false;

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
                "Forgot Password",
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
                          height: 25,
                        ),
                        RoundLineButton(
                          title: "Submit",
                          onPressed: () {},
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
