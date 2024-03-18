import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final Image image;
  final String programType;
  final String programName;
  final String bottomInfo;
  final Widget? bottomWidget;

   const ProgramCard({
    super.key,
    required this.image,
    required this.programType,
    required this.programName,
    required this.bottomInfo,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Color(0x140E443E),
            blurRadius: 12,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8),),
            child: image,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  programType,
                  style: TextStyle(
                      color: Color(0xff598BED),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  programName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bottomInfo,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    if (bottomWidget != null) bottomWidget!,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
