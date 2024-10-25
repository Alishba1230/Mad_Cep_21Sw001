import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchGridContain extends StatelessWidget {
  final Map sObj;
  final int index;
  const SearchGridContain({super.key, required this.sObj, required this.index});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: PColor.searchBGColor[(index % PColor.searchBGColor.length)],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
      child: Column(
        children: [
          Text(
            sObj["name"].toString(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              sObj["img"].toString(),
              width: media.width * 0.26,
              height: media.width * 0.26 * 1.5,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
