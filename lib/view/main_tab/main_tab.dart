import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/account/account.dart';
import 'package:bookstore_mad_project/view/cart/cart.dart';
import 'package:bookstore_mad_project/view/home/home.dart';
import 'package:bookstore_mad_project/view/onboarding/welcome_screen.dart';
import 'package:bookstore_mad_project/view/ourBooks/ourBooks.dart';
import 'package:bookstore_mad_project/view/search/search.dart';
import 'package:bookstore_mad_project/wishlist/WishList.dart';
import 'package:flutter/material.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldkey = GlobalKey<ScaffoldState>();

class _MainTabScreenState extends State<MainTabScreen>
    with TickerProviderStateMixin {
  TabController? controller;
  int selectMenu = 0;
  List menu = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Store", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Account", "icon": Icons.account_circle},
    {"name": "Log Out", "icon": Icons.logout},
  ];
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldkey,
      endDrawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/download (2).jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media.width * 0.5),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 15)
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menu.map((mObj) {
                    var index = menu.indexOf(mObj);
                    return Container(
                      // margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: selectMenu == index
                          ? BoxDecoration(
                              color: PColor.primaryPink,
                              boxShadow: [
                                  BoxShadow(
                                      color: PColor.primaryPink,
                                      //blurRadius: 10,
                                      offset: Offset(0, 3))
                                ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OurBooksScreen()));
                            selectMenu = 0;
                            sideMenuScaffoldkey.currentState?.closeEndDrawer();
                          }
                          if (index == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountScreen()));
                            selectMenu = 0;
                            sideMenuScaffoldkey.currentState?.closeEndDrawer();
                          }
                          if (index == 7) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                            selectMenu = 0;
                            sideMenuScaffoldkey.currentState?.closeEndDrawer();
                          } else {
                            setState(() {
                              selectMenu = index;
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                  color: selectMenu == index
                                      ? Colors.white
                                      : PColor.text,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              mObj["icon"],
                              color: selectMenu == index
                                  ? Colors.white
                                  : Color.fromARGB(255, 199, 7, 94),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Color.fromARGB(255, 199, 7, 94),
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(
                              color: PColor.subtitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 2,
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                              color: PColor.subtitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          HomeScreen(),
          SearchScreen(),
          WishListScreen(),
          BookCartScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/download (2).jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: TabBar(
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
            unselectedLabelStyle: TextStyle(fontSize: 12),
            labelStyle: TextStyle(fontSize: 13),
            controller: controller,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.menu),
                text: "WishList",
              ),
              Tab(
                icon: Icon(Icons.shopping_bag),
                text: "Cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
