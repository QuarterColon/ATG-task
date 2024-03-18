import 'package:atg_task1/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Priya!",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "What do you wanna learn today?",
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  icon: SvgPicture.asset("assets/Book-mark.svg"),
                  text: "Programs",
                ),
                CustomButton(
                  icon: SvgPicture.asset("assets/Book-mark.svg"),
                  text: "Programs",
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  icon: SvgPicture.asset("assets/Book-mark.svg"),
                  text: "Programs",
                ),
                CustomButton(
                  icon: SvgPicture.asset("assets/Book-mark.svg"),
                  text: "Programs",
                ),
              ],
            ),

            Container(
              color: Colors.white,
              child: Column(
                children: [

                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}
