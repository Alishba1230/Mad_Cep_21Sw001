import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchRow extends StatelessWidget {
  final Map sObj;
  const SearchRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              sObj["img"].toString(),
              width: media.width * 0.28,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                sObj["name"].toString(),
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
                sObj["author"].toString(),
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
                  initialRating:
                      double.tryParse(sObj["rating"].toString()) ?? 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
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
              Text(
                sObj["descripton"].toString(),
                maxLines: 4,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 11,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                  Expanded(
                    child: Container(
                      height: 27.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: PColor.text,
                            shadowColor: Colors.transparent),
                        child: Text(
                          'Wishlist',
                          style: TextStyle(
                              color: PColor.text,
                              fontWeight: FontWeight.w700,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}