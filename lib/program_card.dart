import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {

  const ProgramCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 242,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/Frame 122.jpg"),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LIFESTYLE",
                  style: TextStyle(
                      color: Color(0xff598BED),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(height: 10,),
                Text(
                  "A complete guide for your new born baby",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "16 lessons",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
