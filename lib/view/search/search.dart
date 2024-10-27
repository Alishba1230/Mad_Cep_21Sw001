import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/common/extension.dart';
import 'package:bookstore_mad_project/commonWidget/search_grid.dart';
import 'package:bookstore_mad_project/commonWidget/search_row.dart';
import 'package:bookstore_mad_project/view/search/FSearch.dart';
import 'package:bookstore_mad_project/view/search/filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  List argument = [];
  List tags = ["Genre", "New Release", "Mystery", "Romance", "Fantasy"];
  List SGenreContent = [
    {
      "name": "Fantasy",
      "img": "assets/img/gen1.jpg",
    },
    {
      "name": "Self Help",
      "img": "assets/img/gen2.jpg",
    },
    {
      "name": "Romance",
      "img": "assets/img/gen3.jpg",
    },
    {
      "name": "Non-Fiction",
      "img": "assets/img/gen4.jpg",
    },
    {
      "name": "Mystery",
      "img": "assets/img/gen5.jpg",
    },
    {
      "name": "Science",
      "img": "assets/img/gen6.jpg",
    },
  ];
  List ResultSearch = [];
  Future<void> fetchBookData() async {
    CollectionReference booksCollection =
        FirebaseFirestore.instance.collection('books');

    List fetchedBooks = [];

    for (String bookName in argument) {
      QuerySnapshot querySnapshot =
          await booksCollection.where('name', isEqualTo: bookName).get();

      for (var doc in querySnapshot.docs) {
        fetchedBooks.add(doc.data() as Map<String, dynamic>);
      }
    }

    setState(() {
      ResultSearch = fetchedBooks;
    });
  }

  int selectTag = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PColor.backG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: PColor.textBox,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: search,
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FSearchScreen(
                        didSearch: (sText, foundbooks) {
                          search.text = sText;
                          argument = foundbooks;
                          fetchBookData();
                          if (mounted) {
                            setState(() {});
                          }
                        },
                      ),
                    ));
                    endEditing();
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterScreen(
                                      didFilter: (fObj) {
                                        if (mounted) {
                                          setState(() {});
                                        }
                                      },
                                    )));
                      },
                      icon: const Icon(
                        Icons.tune,
                        color: Colors.black38,
                      ),
                    ),
                    hintText: "Search Books & Authors",
                    labelStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter The Specified Value Correctly';
                    }
                    return null;
                  },
                ),
              ),
            ),
            if (search.text.isNotEmpty)
              const SizedBox(
                width: 8,
              ),
            if (search.text.isNotEmpty)
              TextButton(
                onPressed: () {
                  search.clear();
                  setState(() {});
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: tags.map((tagName) {
                  var index = tags.indexOf(tagName);
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectTag = index;
                        });
                      },
                      child: Text(
                        tagName,
                        style: TextStyle(
                          color: selectTag == index
                              ? PColor.text
                              : PColor.subtitle,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          if (search.text.isEmpty)
            Expanded(
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: SGenreContent.length,
                itemBuilder: (context, index) {
                  var sObj = SGenreContent[index] as Map? ?? {};
                  return SearchGridContain(sObj: sObj, index: index);
                },
              ),
            ),
          if (search.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: ResultSearch.length,
                  itemBuilder: (context, index) {
                    var sObj =
                        ResultSearch[index] as Map<String, dynamic>? ?? {};
                    return SearchRow(sObj: sObj);
                  }),
            ),
        ],
      ),
    );
  }
}
