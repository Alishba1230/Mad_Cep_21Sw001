import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/firebase_options.dart';
import 'package:bookstore_mad_project/view/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PColor.primaryPink,
        useMaterial3: true,
        fontFamily: 'SF Pro Text',
      ),
      home: OnboardingScreen(),
    );
  }
}
