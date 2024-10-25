import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/main_tab/main_tab.dart';

import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});
  @override
  State<HelpScreen> createState() => _HelpState();
}

class _HelpState extends State<HelpScreen> {
  String? selectedCity;
  String? selectedState;

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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help us Help you",
                style: TextStyle(
                    color: PColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store.",
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "If you choose to skip, you can change your location at any time in your account settings.",
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: PColor.textBox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(),
                  hint: const Text("State"),
                  items: ["state1", "state2"].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  value: selectedState,
                  onChanged: (String? selectVal) {
                    setState(() {
                      selectedState = selectVal;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: PColor.textBox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(),
                  hint: const Text("City"),
                  items: ["City1", "City2"].map((name) {
                    return DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  value: selectedCity,
                  onChanged: (String? selectVal) {
                    setState(() {
                      selectedCity = selectVal;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainTabScreen()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 16,
                            color: PColor.primaryPink,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
