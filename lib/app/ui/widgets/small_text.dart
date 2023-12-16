// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({
    Key? key,
    required this.text,
    this.size = 12,
    this.height = 1.2,
    this.weight = FontWeight.normal,
    this.color = const Color(0xFFc2c2c2),
    this.overFlow = TextOverflow.ellipsis,
    this.maxLines,
  }) : super(key: key);
  final String text;
  double size;
  double height;
  FontWeight weight;
  Color color;
  TextOverflow overFlow;
  int? maxLines;
  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: maxLines,
        style: TextStyle(
          overflow: overFlow,
          fontSize: size,
          height: height,
          fontWeight: weight,
          color: color,
        ),
      );
}
