import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
   final SvgPicture icon ;
   final String text;

   const CustomButton({super.key, required this.icon, required this.text, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 54,
        width: 180,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Color(0xff598BED),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              text,
              style: TextStyle(
                color: Color(0xff598BED),
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
          ],
        ),
      ),
    );

  }
}
