import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GenreContain extends StatelessWidget {
  final Map bObj;
  final Color bgcolor;
  const GenreContain({super.key, required this.bObj, required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, top: 20),
      padding: const EdgeInsets.only(top: 18, left: 15, right: 15, bottom: 8),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: media.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            bObj["img"].toString(),
            width: media.width * 0.7,
            height: media.width * 0.35,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            bObj["name"].toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
