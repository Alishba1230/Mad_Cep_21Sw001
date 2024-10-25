import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FSearchScreen extends StatefulWidget {
  final Function(String)? didSearch;
  const FSearchScreen({super.key, this.didSearch});

  @override
  State<FSearchScreen> createState() => _FSearchScreenState();
}

class _FSearchScreenState extends State<FSearchScreen> {
  TextEditingController search = TextEditingController();
  List pSearch = ["Search 1", "Search 2", "Search 3"];
  List resultSearch = [
    "The Naming song",
    "The Fallen Fruit",
    "Pride and Prejudice"
  ];
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
                child: Container(
                  decoration: BoxDecoration(
                      color: PColor.textBox,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: search,
                    onChanged: (value) {
                      setState(() {});
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
                  "Previous Searches",
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
                    search.text.isEmpty ? pSearch.length : resultSearch.length,
                itemBuilder: (context, index) {
                  var resultText = (search.text.isEmpty
                          ? pSearch
                          : resultSearch)[index] as String? ??
                      "";
                  return GestureDetector(
                    onTap: () {
                      if (widget.didSearch != null) {
                        widget.didSearch!(resultText);
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
