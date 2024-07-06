import 'package:flutter/material.dart';
import 'package:kamus_istilah/static/colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function event;
  final Color color;
  final Color colorText;
  final double radius;
  const RoundedButton({
    Key? key,
    required this.title,
    required this.event,
    this.color = primaryColor,
    this.colorText = Colors.white,
    this.radius = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: color,
        textStyle: TextStyle(
            fontSize: 14, color: colorText, fontWeight: FontWeight.bold),
        minimumSize: const Size.fromHeight(40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: () => event(),
      child: Text(
        title,
      ),
    );
  }
}
