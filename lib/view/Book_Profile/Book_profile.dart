import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:bookstore_mad_project/view/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailScreen extends StatelessWidget {
  final Map Obj;

  const BookDetailScreen({super.key, required this.Obj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PColor.backG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: media.width * 0.6,
                height: media.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(Obj["img"].toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                Obj["name"].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                Obj["author"].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Example color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'In App Reading',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // Example color
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu,
                              size: 16,
                              color: Colors.white,
                            ),
                            Text(
                              'WishList',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookCartScreen(bookInfo: Obj)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // Example color
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 16,
                              color: Colors.white,
                            ),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: PColor.backG,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "A love worth fighting for. A dream worth dying for. An ending worth waiting for.\n\nIt’s been two months since the Fates were freed from a deck of cards, two months since Legend claimed the throne for his own, and two months since Tella discovered the boy she fell in love with doesn’t really exist.\n\nWith lives, empires, and hearts hanging in the balance, Tella must decide if she’s going to trust Legend or a former enemy. After uncovering a secret that upends her life, Scarlett will need to do the impossible. And Legend has a choice to make that will forever change and define him.\n\nCaraval is over, but perhaps the greatest game of all has begun. There are no spectators this time—only those who will win, and those who will lose everything.",
                    style: TextStyle(
                      fontSize: 13,
                      color: PColor.text.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
