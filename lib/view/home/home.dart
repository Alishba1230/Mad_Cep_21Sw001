import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/best_seller.dart';
import 'package:bookstore_mad_project/commonWidget/genre_pick.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/commonWidget/round_textfield.dart';
import 'package:bookstore_mad_project/commonWidget/top_pick.dart';
import 'package:bookstore_mad_project/firestore.dart';
import 'package:bookstore_mad_project/view/main_tab/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  List topPickContent = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    List<Map<String, dynamic>> books =
        await _firestoreService.getBooksByCategory('Top_Picks');
    setState(() {
      topPickContent = books;
      _isLoading = false;
    });
  }

  List BestSellerContent = [
    {
      "name": "Reveal Me",
      "author": "Tahereh Mafi",
      "img": "assets/img/b3.jpg",
      "rating": 4.7
    },
    {
      "name": "Powerless",
      "author": "Lauren Roberts",
      "img": "assets/img/b1.jpg",
      "rating": 5.0
    },
    {
      "name": "Six of Crows",
      "author": "Leigh Bardugo",
      "img": "assets/img/b2.jpg",
      "rating": 4.5
    },
    {
      "name": "Girls Of Paper And Fire ",
      "author": "Natasha Ngan",
      "img": "assets/img/b4.jpg",
      "rating": 4.2
    },
    {
      "name": "Where Dreams Descend",
      "author": "Janella Angeles ",
      "img": "assets/img/b5.jpg",
      "rating": 3.8
    },
    {
      "name": "The Ballad Of Never After",
      "author": "Stephanie Garber",
      "img": "assets/img/b6.jpg",
      "rating": 4
    },
  ];
  List GenreContent = [
    {
      "name": "Fantasy",
      "img": "assets/img/gf1.png",
    },
    {
      "name": "Romance",
      "img": "assets/img/gf2.png",
    },
    {
      "name": "Mystery & Thriller",
      "img": "assets/img/file.png",
    },
  ];
  List RecentContent = [
    {
      "name": "Believe Me",
      "author": "Tahereh Mafi",
      "img": "assets/img/r1.jpg",
      "rating": 4.7
    },
    {
      "name": "Rewitched",
      "author": "Lucy Jane Wood",
      "img": "assets/img/r2.jpg",
      "rating": 5.0
    },
    {
      "name": "Intuitive Healing For Women",
      "author": "Sarah Hale",
      "img": "assets/img/r3.jpg",
      "rating": 4.5
    },
    {
      "name": "Love from Mecca to Medina",
      "author": "S.K. Ali",
      "img": "assets/img/r44.jpg",
      "rating": 4.2
    },
    {
      "name": "Wild Love",
      "author": "Elsie Silver ",
      "img": "assets/img/r5.jpg",
      "rating": 3.8
    },
    {
      "name": "A Dark and Drowning Tide",
      "author": "Allison Saft",
      "img": "assets/img/r6.jpg",
      "rating": 4
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PColor.backG,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                        color: PColor.primaryPink,
                        borderRadius: BorderRadius.circular(media.width * 0.5),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(media.width * 0.5),
                        child: Image.asset(
                          'assets/img/psk.jpg',
                          fit: BoxFit.cover,
                          width: media.width,
                          height: media.width,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Row(
                        children: [
                          Text(
                            "Our Top Picks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                            onPressed: () {
                              sideMenuScaffoldkey.currentState?.openEndDrawer();
                            },
                            icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: topPickContent.isEmpty
                          ? Center(
                              child:
                                  CircularProgressIndicator()) // Loading indicator
                          : CarouselSlider.builder(
                              itemCount: topPickContent.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                var iObj =
                                    topPickContent[itemIndex] as Map? ?? {};
                                return TopPickContain(iObj: iObj);
                              },
                              options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1,
                                enlargeCenterPage: true,
                                viewportFraction: 0.47,
                                enlargeFactor: 0.38,
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Bestsellers",
                            style: TextStyle(
                                color: PColor.text,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: BestSellerContent.length,
                        itemBuilder: ((context, index) {
                          var bObj = BestSellerContent[index] as Map? ?? {};
                          return BestSellerContain(bObj: bObj);
                        }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Genres",
                            style: TextStyle(
                                color: PColor.text,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: GenreContent.length,
                        itemBuilder: ((context, index) {
                          var rObj = GenreContent[index] as Map? ?? {};
                          return GenreContain(
                            bObj: rObj,
                            bgcolor: index % 2 == 0
                                ? const Color(0xffffafcc)
                                : const Color.fromARGB(31, 177, 54, 69),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.2,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Recently Viewed",
                            style: TextStyle(
                                color: PColor.text,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: RecentContent.length,
                        itemBuilder: ((context, index) {
                          var rObj = RecentContent[index] as Map? ?? {};
                          return BestSellerContain(bObj: rObj);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Monthly Newsletter",
                            style: TextStyle(
                                color: PColor.text,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.01,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                        color: PColor.textBox.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                            style: TextStyle(
                              color: PColor.text,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RoundTextfield(
                        hintText: "First & Last Name",
                        controller: name,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15,
                      ),
                      child: RoundTextfield(
                        hintText: "Email Address",
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.all(15),
                            width: media.width * 0.6,
                            child: RoundButton(
                                title: "Sign Up",
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'Thank You For Subscribing to our Monthly Newsletter '),
                                  ));
                                  name.clear();
                                  email.clear();
                                })),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}