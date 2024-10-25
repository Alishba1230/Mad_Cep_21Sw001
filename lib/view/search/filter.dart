import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterScreen extends StatefulWidget {
  final Function(Map)? didFilter;
  const FilterScreen({super.key, this.didFilter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectSort = 0;
  int selectGen = 0;
  int selectRate = 0;

  List sortBy = [
    "Featured titles",
    "Price: Low to High",
    "Price: High to Low",
    "Publication Date",
    "A - Z"
  ];
  List genre = [
    "Fantasy",
    "Non-Fiction",
    "Science",
    "Mystery",
    "Romance",
    "Self Help"
  ];
  List ratingArr = [5.0, 4.0, 3.0, 2.0, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        //automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Filter",
                style: TextStyle(
                    color: PColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: PColor.text,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text(
                "Sort By",
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              shrinkWrap: true,
              itemCount: sortBy.length,
              itemBuilder: (context, index) {
                var itemName = sortBy[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectSort = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          selectSort == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: selectSort == index
                              ? PColor.primaryPink
                              : PColor.subtitle,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(
                              color: PColor.subtitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 23),
              child: Text(
                "Genre",
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              shrinkWrap: true,
              itemCount: genre.length,
              itemBuilder: (context, index) {
                var itemName = genre[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGen = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          selectGen == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: selectGen == index
                              ? PColor.primaryPink
                              : PColor.subtitle,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(
                              color: PColor.subtitle,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 23),
              child: Text(
                "Customer Review",
                style: TextStyle(
                  color: PColor.subtitle,
                  fontSize: 13,
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: ratingArr.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var itemName = ratingArr[index] as double? ?? 1.0;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectRate = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                            selectRate == index
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: selectRate == index
                                ? PColor.primaryPink
                                : PColor.subtitle),
                        const SizedBox(
                          width: 15,
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: itemName,
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
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: PColor.backG,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 3, offset: Offset(0, -3)),
          ],
        ),
        child: BottomAppBar(
          elevation: 10,
          color: PColor.backG,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Expanded(
              child: RoundButton(
                  title: "Apply",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
