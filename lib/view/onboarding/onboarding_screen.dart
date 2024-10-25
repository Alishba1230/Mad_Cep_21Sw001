import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? controller = PageController();
  int page = 0;
  List pageContent = [
    {
      "title": "Discounted\nSecondhand Books",
      "sub_title": "Used and near new secondhand books at great prices.",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Local Book Haven\nBook Blossoms",
      "sub_title":
          "Launching Book Blossoms, where every corner blooms with a story.",
      "image": "assets/img/on_2.png"
    },
    {
      "title": "Sell or Recycle Your \nOld Books With Us",
      "sub_title":
          "If you're looking to downsize, sell or recycle old\nbooks, the Book Blossoms can help.",
      "image": "assets/img/on_3.png"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller?.addListener(() {
      page = controller?.page?.round() ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffff0f3),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller,
                itemCount: pageContent.length,
                itemBuilder: (context, index) {
                  var pObj = pageContent[index] as Map? ?? {};

                  return Container(
                    width: media.width,
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            pObj["title"].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: PColor.primaryPink,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            pObj["sub_title"].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: PColor.primaryLightPink,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.25,
                          ),
                          Image.asset(
                            pObj["image"].toString(),
                            width: media.width * 0.6,
                          )
                        ],
                      ),
                    ),
                  );
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: PColor.primaryPink,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageContent.map((pObj) {
                          var index = pageContent.indexOf(pObj);
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: page == index
                                  ? PColor.primaryPink
                                  : PColor.primaryLightPink,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                          );
                        }).toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          if (page < 2) {
                            page = page + 1;
                            controller?.jumpToPage(page);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()));
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: PColor.primaryPink,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
