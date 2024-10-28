import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/search/SearchGenre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bookstore_mad_project/firestore.dart';

class SearchGridContain extends StatefulWidget {
  final Map sObj;
  final int index;

  SearchGridContain({super.key, required this.sObj, required this.index});

  @override
  State<SearchGridContain> createState() => _SearchGridContainState();
}

class _SearchGridContainState extends State<SearchGridContain> {
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> genre = [];
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    List<Map<String, dynamic>> books = await _firestoreService
        .getBooksByCategory(widget.sObj["name"].toString());
    setState(() {
      genre = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchResultsScreen(resultList: genre)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: PColor
              .searchBGColor[(widget.index % PColor.searchBGColor.length)],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        child: Column(
          children: [
            Text(
              widget.sObj["name"].toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.sObj["img"].toString(),
                width: media.width * 0.26,
                height: media.width * 0.26 * 1.5,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
