import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:bookstore_mad_project/view/Book_Profile/Book_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopPickContain extends StatelessWidget {
  final Map<String, dynamic> iObj;
  const TopPickContain({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (Context) => BookDetailScreen(Obj: iObj)));
      },
      child: SizedBox(
        width: media.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: PColor.backG,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  iObj["img"].toString(),
                  width: media.width * 0.37,
                  height: media.width * 0.55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              iObj["name"].toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: PColor.text,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              iObj["author"].toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PColor.subtitle,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
