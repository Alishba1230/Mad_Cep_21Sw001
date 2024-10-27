import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore_mad_project/common/color_extension.dart';
import 'cart_provider.dart';

class BookCartScreen extends StatefulWidget {
  @override
  State<BookCartScreen> createState() => _BookCartScreenState();
}

class _BookCartScreenState extends State<BookCartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: PColor.backG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Book Blossom Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: cart.cartItems.isNotEmpty
          ? ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final book = cart.cartItems[index];
                int quantity = book['quantity'] ?? 1;
                int price = book['price'];
                return Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 5),
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(8.0),
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
                              image: AssetImage(book['img']),
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
                                book['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                book['author'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '\$${price * quantity}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity += 1;
                                        });
                                        cart.updateQuantity(book, quantity);
                                      },
                                      icon: Icon(Icons.add)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (quantity > 1) {
                                            quantity -= 1;
                                          } else {
                                            cart.removeFromCart(book);
                                          }
                                        });
                                        cart.updateQuantity(book, quantity);
                                        if (quantity == 0) {
                                          cart.removeFromCart(book);
                                        }
                                      },
                                      icon: Icon(Icons.remove)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  cart.removeFromCart(book);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  minimumSize: const Size(double.infinity, 36),
                                ),
                                child: const Text(
                                  'Remove from Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'No books in cart currently.',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ),
      bottomNavigationBar: cart.cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : null,
    );
  }
}
