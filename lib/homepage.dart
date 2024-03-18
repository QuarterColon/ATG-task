import 'package:atg_task1/bottomnav.dart';
import 'package:atg_task1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List screens = [
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF3FD),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/leading_icon.svg",
          ),
        ),
        leadingWidth: 64,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/action1.svg",width: 32,),
                SizedBox(width: 16,),
                SvgPicture.asset("assets/Notification_icon.svg", width: 32,),
              ],
            ),
          )

        ],

      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNav(),
    );
  }
}
