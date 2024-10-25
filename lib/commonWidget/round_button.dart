import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0), // Adjust radius
      ),
      textColor: Colors.white,
      color: PColor.primaryPink,
      height: 45,
      minWidth: double.maxFinite,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class RoundLineButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundLineButton(
      {super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: getColor(Colors.white, PColor.primaryPink),
            foregroundColor: getColor(PColor.primaryPink, Colors.white),
            shadowColor: MaterialStateProperty.resolveWith(
                (states) => PColor.primaryPink),
            minimumSize: MaterialStateProperty.resolveWith(
                (states) => const Size(double.maxFinite, 50)),
            elevation: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.pressed) ? 1 : 0),
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        width: 1,
                        color: states.contains(MaterialState.pressed)
                            ? Colors.transparent
                            : PColor.primaryPink)))),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.pressed) ? colorPressed : color);
  }
}
