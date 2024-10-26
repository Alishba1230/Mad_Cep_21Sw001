import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/commonWidget/search_row.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FSearchScreen extends StatefulWidget {
  final Function(String, List)? didSearch;
  const FSearchScreen({super.key, this.didSearch});

  @override
  State<FSearchScreen> createState() => _FSearchScreenState();
}

class _FSearchScreenState extends State<FSearchScreen> {
  TextEditingController search = TextEditingController();
  List AllBooks = [];
  List pSearch = [];
  List resultSearch = [
    "The Naming song",
    "The Fallen Fruit",
    "Pride and Prejudice"
  ];
  List foundBooks = [];
  @override
  void initState() {
    super.initState();
    fetchBookNames();
  }

  void _runFilter(String enterKeyword) {
    List Result = [];
    if (enterKeyword.isEmpty) {
      Result = [];
    } else {
      Result = AllBooks.where(
              (book) => book.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundBooks = Result;
    });
  }

  Future<void> fetchBookNames() async {
    List bookNames = [];
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('books').get();
      for (var doc in querySnapshot.docs) {
        bookNames.add(doc['name']);
      }
      setState(() {
        AllBooks = bookNames;
      });
    } catch (e) {
      print("Error fetching names: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 0,
          leading: Container(),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: PColor.textBox,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: search,
                    onChanged: (value) {
                      _runFilter(value);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: PColor.text,
                      ),
                      hintText: "Search Here",
                      labelStyle:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ),
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
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (search.text.isEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 23),
                child: Text(
                  "",
                  style: TextStyle(
                      color: PColor.subtitle,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                itemCount:
                    search.text.isEmpty ? pSearch.length : foundBooks.length,
                itemBuilder: (context, index) {
                  var resultText = (search.text.isEmpty
                          ? pSearch
                          : foundBooks)[index] as String? ??
                      "";
                  return GestureDetector(
                    onTap: () {
                      if (widget.didSearch != null) {
                        widget.didSearch!(resultText, foundBooks);
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                            color: PColor.subtitle,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                              child: Text(
                            resultText,
                            style: TextStyle(
                                color: PColor.subtitle,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )),
                          Text(
                            "times",
                            style: TextStyle(
                              color: PColor.primaryLightPink,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
