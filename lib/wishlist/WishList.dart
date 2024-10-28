import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/cart/cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<Map<String, dynamic>> books = [];

  @override
  void initState() {
    super.initState();
    fetchWishlist();
  }

  Future<void> fetchWishlist() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference wishlistCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist');

    QuerySnapshot querySnapshot = await wishlistCollection.get();
    List<Map<String, dynamic>> wishlistBooks = [];

    for (var doc in querySnapshot.docs) {
      wishlistBooks.add({
        ...doc.data() as Map<String, dynamic>,
        'id': doc.id, // Store the document ID for deletion
      });
    }

    setState(() {
      books = wishlistBooks;
    });
  }

  Future<void> deleteBook(String bookId) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference wishlistCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist');

    await wishlistCollection.doc(bookId).delete();

    setState(() {
      books.removeWhere((book) => book['id'] == bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: PColor.backG,
      appBar: AppBar(
        title: const Text(
          "WishList",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/download (2).jpg'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> ref = books[index];
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
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          books[index]["name"].toString(),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: PColor.text,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          books[index]["author"].toString(),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Price: \$${books[index]['price'].toString()}',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const SizedBox(height: 2),
                        Text(
                          books[index]['description'].toString(),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: PColor.subtitle,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
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
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                  gradient:
                                      LinearGradient(colors: PColor.button),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: PColor.primaryPink,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Provider.of<Cart>(context, listen: false)
                                        .addToCart(ref);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Book added to cart successfully!'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              height: 30.0,
                              child: IconButton(
                                onPressed: () {
                                  deleteBook(books[index]['id']);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: PColor.primaryPink,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
