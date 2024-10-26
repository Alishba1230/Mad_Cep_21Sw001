import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/Book_Profile/Book_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BestSellerContain extends StatelessWidget {
  final Map bObj;
  const BestSellerContain({super.key, required this.bObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (Context) => BookDetailScreen(Obj: bObj)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, top: 20),
        width: media.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: PColor.backG,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  bObj["img"].toString(),
                  width: media.width * 0.37,
                  height: media.width * 0.55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              bObj["name"].toString(),
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: PColor.text,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              bObj["author"].toString(),
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: PColor.subtitle,
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                initialRating: double.tryParse(bObj["rating"].toString()) ?? 1,
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
          ],
        ),
      ),
    );
  }
}
