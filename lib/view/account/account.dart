import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List purchase = ["assets/img/1.jpg", "assets/img/2.jpg", "assets/img/3.jpg"];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PColor.backG,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alishba Shaikh",
                        style: TextStyle(
                            color: PColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lost somewhere between reality and my favorite fantasy books.",
                        style: TextStyle(
                          color: PColor.subtitle,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        "assets/img/account.png",
                        width: 80,
                        height: 80,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hyderabad - Pakistan",
                      style: TextStyle(
                        color: PColor.subtitle,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 27.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: PColor.button),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: PColor.primaryPink,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Books",
                        style: TextStyle(
                          color: PColor.subtitle,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Your Purchase",
                style: TextStyle(
                    color: PColor.subtitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: media.width * 0.5,
                  width: media.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 208, 62, 108),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: purchase.map((iName) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.only(left: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            iName,
                            height: media.width * 0.6,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
