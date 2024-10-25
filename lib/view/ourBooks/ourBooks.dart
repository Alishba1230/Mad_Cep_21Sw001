import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OurBooksScreen extends StatefulWidget {
  const OurBooksScreen({super.key});

  @override
  State<OurBooksScreen> createState() => _OurBooksScreenState();
}

class _OurBooksScreenState extends State<OurBooksScreen> {
  List image = [
    "assets/img/our1.jpg",
    "assets/img/our2.jpg",
    "assets/img/our3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PColor.backG,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  //color: Colors.red,
                  height: 250,
                  child: Image.asset(
                    "assets/img/our.png",
                    alignment: Alignment.topCenter,
                    width: media.width * 5,
                    fit: BoxFit.cover,
                  ),
                ),
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
                Container(
                  height: media.width * 0.77,
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: image.map((iName) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            iName,
                            height: 120,
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
              child: Text(
                """The Book Grocer online offers a broad and ever increasing range of discounted remainder and secondhand books.
            
            Our specialty is sourcing discounted books of amazing quality and passing on to our customers the best possible price.
            We take our book buying very seriously indeed. We scour the globe and the best publishers and suppliers for the best bargains, but no book simply arrives in our warehouse simply because it's cheap. It has to be something we want to read ourselves and would reccomend to others.
            We like to be known as the business which sells discounted books yet looks and feels like a retail bookstore.
            
            We are an Australian, family-owned business. We have been buying and selling books since 2000, when the first Castlebooks store opened in Kingston, ACT.
            
            In 2007 we opened the first Book Grocer in Brunswick, Victoria. Book Grocers can now be found in a range of locations across Victoria, NSW, and of course, Canberra.
            
            Our staff also love reading and recommending books to others and we are proud of the role they play in demonstrating to our customers how good discount books can be.""",
                textAlign: TextAlign.center,
                style: TextStyle(color: PColor.subtitle, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
