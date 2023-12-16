// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// class ExpandableText extends StatefulWidget {
//   ExpandableText({super.key, required this.text, this.heigth = 1.6});
//   final String text;
//   double heigth;

//   @override
//   State<ExpandableText> createState() => _ExpandableTextState();
// }

// class _ExpandableTextState extends State<ExpandableText> {
//   late String firstText;
//   late String secondText;
//   bool hiddenText = true;
//   double textHeight = Dimensions.screenHeight / 5.63;
//   @override
//   void initState() {
//     if (widget.text.length > textHeight) {
//       firstText = widget.text.substring(0, textHeight.toInt());
//       secondText =
//           widget.text.substring(textHeight.toInt() + 1, widget.text.length);
//     } else {
//       firstText = widget.text;
//       secondText = '';
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: textHeight,
//       child: secondText.isEmpty
//           ? SmallText(
//               text: firstText,
//               color: AppClr.paraColor,
//               size: 16,
//               height: 1.6,
//               overFlow: TextOverflow.clip,
//             )
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SmallText(
//                     color: AppClr.paraColor,
//                     overFlow: TextOverflow.clip,
//                     height: widget.heigth,
//                     size: 16,
//                     text: hiddenText == true
//                         ? (firstText + ' ... ')
//                         : (firstText + secondText)),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       hiddenText = !hiddenText;
//                     });
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SmallText(
//                         text: hiddenText == true ? 'See more' : 'See less',
//                         size: 18,
//                         color: AppClr.primaryColor1,
//                       ),
//                       Icon(
//                         hiddenText == true
//                             ? Icons.arrow_drop_down
//                             : Icons.arrow_drop_up,
//                         size: 28,
//                         color: AppClr.primaryColor1,
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
