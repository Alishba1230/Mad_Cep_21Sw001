import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/common/extension.dart';
import 'package:bookstore_mad_project/commonWidget/search_grid.dart';
import 'package:bookstore_mad_project/commonWidget/search_row.dart';
import 'package:bookstore_mad_project/view/search/FSearch.dart';
import 'package:bookstore_mad_project/view/search/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
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
  List ResultSearch = [
    {
      "name": "The Naming Song",
      "author": "Jedediah Berry",
      "img": "assets/img/sr1.jpg",
      "descripton":
          "There's nothing more dangerous than an unnamed thing When the words went away, the world changed.",
      "rating": 3.89
    },
    {
      "name": "The Fallen Fruit",
      "author": "Shawntelle Madison",
      "img": "assets/img/sr2.jpg",
      "descripton":
          "Combining history and fantasy, a sweeping multi-generational epic about a woman who travels through time to end a family curse that has plagued her ancestors for generations.",
      "rating": 3.78
    },
    {
      "name": "Songlight",
      "author": "Moira Buffini",
      "img": "assets/img/sr3.jpg",
      "descripton":
          "Star-crossed lovers, against-all-odds friendship, and a brutally unforgiving world make this first in a trilogy utterly unforgettable.",
      "rating": 4.23
    },
  ];

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
                        didSearch: (sText) {
                          search.text = sText;
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
                      var sObj = ResultSearch[index] as Map? ?? {};
                      return SearchRow(sObj: sObj);
                    })),
        ],
      ),
    );
  }
}
