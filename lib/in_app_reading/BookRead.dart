import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookReadingScreen extends StatefulWidget {
  final String bookName;

  const BookReadingScreen({super.key, required this.bookName});

  @override
  State<BookReadingScreen> createState() => _BookReadingScreenState();
}

class _BookReadingScreenState extends State<BookReadingScreen> {
  late PdfControllerPinch pdfControllerPinch;
  int totalPageCount = 0, currentPage = 1;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadPdfFromFirebase(widget.bookName);
  }

  Future<void> _loadPdfFromFirebase(String bookName) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('$bookName.pdf');
      final pdfUrl = await storageRef.getDownloadURL();

      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openData(
            (await NetworkAssetBundle(Uri.parse(pdfUrl)).load(pdfUrl))
                .buffer
                .asUint8List()),
      );

      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bookName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/download (2).jpg'),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
      body: loading ? Center(child: CircularProgressIndicator()) : _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Total Pages: $totalPageCount"),
            IconButton(
              onPressed: () => pdfControllerPinch.previousPage(
                  duration: Duration(milliseconds: 500), curve: Curves.linear),
              icon: Icon(Icons.arrow_back),
            ),
            Text("Current Page: $currentPage"),
            IconButton(
              onPressed: () => pdfControllerPinch.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.linear),
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
    return Expanded(
      child: PdfViewPinch(
        controller: pdfControllerPinch,
        onDocumentLoaded: (doc) {
          setState(() => totalPageCount = doc.pagesCount);
        },
        onPageChanged: (page) {
          setState(() => currentPage = page);
        },
      ),
    );
  }
}
