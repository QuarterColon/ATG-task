import 'package:atg_task1/custom_button.dart';
import 'package:atg_task1/program_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Color(0xffEEF3FD),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Priya!",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
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
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      icon: SvgPicture.asset(
                        "assets/Book-mark.svg",
                        fit: BoxFit.cover,
                      ),
                      text: "Programs",
                    ),
                    CustomButton(
                      icon: SvgPicture.asset("assets/help-circle.svg"),
                      text: "Get Help",
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
                      icon: SvgPicture.asset("assets/Book-open.svg"),
                      text: "Learn",
                    ),
                    CustomButton(
                      icon: SvgPicture.asset("assets/trello.svg"),
                      text: "DD Tracker",
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Programs for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProgramCard(
                image: Image.asset("assets/Frame 122.jpg"),
                programName: "A complete guide for your new born baby",
                programType: "LIFESTYLE",
                bottomInfo: "16 lessons",
              ),
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Events and Experiences",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProgramCard(
                image: Image.asset(
                  'assets/lady_image.jpeg',
                  width: 280,
                ),
                programType: "BABYCARE",
                programName: "Understanding of human behaviour",
                bottomInfo: "13 Feb, Sunday",
                bottomWidget: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(80, 32),
                    backgroundColor: Color(0xffffff),
                    side: BorderSide(
                      color: Color(0xff598BED),
                    ),
                  ),
                  child: Text(
                    "Book",
                    style: TextStyle(
                      color: Color(0xff598BED),
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lessons for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProgramCard(
                image: Image.asset(
                  "assets/lady_image.jpeg",
                ),
                programName: "Understanding of human behaviour",
                programType: "BABYCARE",
                bottomInfo: "13 Feb, Sunday",
                bottomWidget: SvgPicture.asset("assets/lock.svg"),
              ),
              itemCount: 5,
            ),
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
