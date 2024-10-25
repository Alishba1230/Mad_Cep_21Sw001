import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WishListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> books = [
    {
      'name': "Pride and Prejudice",
      'author': "Jane Austen",
      'rating': 4.03,
      'price': 40,
      'img': 'assets/img/2.jpg',
    },
    {
      'name': "A Curse of True Love",
      'author': "Stephanie Garber",
      'rating': 4.26,
      'price': 34,
      'img': 'assets/img/3.jpg',
    },
    {
      'name': "Finale",
      'author': "Stephanie Garber",
      'rating': 4.33,
      'price': 37,
      'img': 'assets/img/1.jpg',
    },
    {
      'name': "Powerless",
      'author': "Lauren Roberts",
      'rating': 4.33,
      'price': 45,
      'img': 'assets/img/b1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/download (2).jpg'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Background color overlay for readability
            Container(
              color: Colors.black.withOpacity(0.3), // Adjust opacity for effect
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      books[index]["img"].toString(),
                      width: media.width * 0.3,
                      height: media.width * 0.3 * 1.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Text(
                        books[index]["name"].toString(),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: PColor.text,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        books[index]["author"].toString(),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Price: \$${books[index]['price'].toString()}',
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: RatingBar.builder(
                          initialRating: double.tryParse(
                                  books[index]["rating"].toString()) ??
                              1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: PColor.primaryPink,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              height: 27.0,
                              decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: PColor.button),
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
                                  'Add to Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
