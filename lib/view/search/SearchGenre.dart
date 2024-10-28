import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:bookstore_mad_project/commonWidget/search_row.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> resultList;

  SearchResultsScreen({super.key, required this.resultList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColor.backG,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/download (2).jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                var sObj = resultList[index];
                return SearchRow(sObj: sObj);
              },
            ),
          ),
        ],
      ),
    );
  }
}
