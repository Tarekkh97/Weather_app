// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText(
      {Key? key,
      required this.text,
      this.size = 20,
      this.weight = FontWeight.bold,
      this.color = const Color(0xFF322d2b),
      this.overflow = TextOverflow.ellipsis,
      this.maxLine})
      : super(key: key);
  final String text;
  int? maxLine;
  double size;
  FontWeight weight;
  Color color;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLine,
        style: TextStyle(
          overflow: overflow,
          fontSize: size,
          fontWeight: weight,
          color: color,
        ));
  }
}
