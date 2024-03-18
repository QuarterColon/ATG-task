import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});
  static int selectedIndex = 0;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      onTap: (int currentIndex) {
        setState(() {
          BottomNav.selectedIndex = currentIndex;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xff598BED),
      selectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            // color: Color(0xff598BED),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/learn_icon.svg"),
          label: "Learn",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/hub_icon.svg"),
          label: "Hub",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/chat_icon.svg"),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            foregroundImage: AssetImage("assets/profile_image.png"),
            radius: 10,
          ),
          label: "Profile",
        ),
      ],
      currentIndex: BottomNav.selectedIndex,
    );
  }
}
