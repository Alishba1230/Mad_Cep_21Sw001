import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/home/home.dart';
import 'package:bookstore_mad_project/view/main_tab/main_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookCartScreen extends StatelessWidget {
  final Map? bookInfo;

  const BookCartScreen({super.key, this.bookInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.backG,
      body: Stack(
        children: [
          Container(
            height: 85,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/download (2).jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Book Blossom Cart',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainTabScreen()));
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: bookInfo != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(bookInfo!['img'].toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookInfo!['name'].toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      bookInfo!['author'].toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${bookInfo!['price'].toString()}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Subtotal (1 Item)    \$${bookInfo!['price'].toString()}',
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Proceed to Checkout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'No book in cart currently.',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
