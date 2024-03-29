import 'dart:convert';

import 'package:atg_task1/custom_button.dart';
import 'package:atg_task1/program_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  String getMonthInWords(int month) {
    List<String> months = [
      'Jan',
      'Feb',
      'March',
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return months[month - 1];
  }

  String getDayOfWeek(int weekday) {
    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return days[weekday - 1];
  }

  Future<Map> fetchLessons() async {
    final Map data;
    try {
      http.Response response = await http.get(
          Uri.parse("https://632017e19f82827dcf24a655.mockapi.io/api/lessons"));

      final data = json.decode(response.body);
      print(data["items"][0]);
      return data;
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      throw Exception(e.toString());
    }
  }

  Future<Map> fetchPrograms() async {
    final Map data;
    try {
      http.Response response = await http.get(Uri.parse(
          "https://632017e19f82827dcf24a655.mockapi.io/api/programs"));

      final data = json.decode(response.body);
      print(data["items"][0]);
      return data;
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: Color(0xffEEF3FD),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
          SizedBox(
            height: 250,
            child: FutureBuilder(
              future: fetchPrograms(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('An error occurred!'));
                } else {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!["items"].length,
                      itemBuilder: (context, index) {
                        var lesson = snapshot.data!["items"][index];
                        return ProgramCard(
                          image: Image.asset("assets/Frame 122.jpg"),
                          programName: lesson["name"],
                          programType: lesson["category"],
                          bottomInfo: "${lesson["lesson"]} lessons",
                        );
                      },
                    );
                  } else {
                    // Handle the case where there's no data
                    return Center(child: Text('No data found!'));
                  }
                }
              },
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
          SizedBox(
            height: 310,
            child: FutureBuilder(
              future: fetchPrograms(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('An error occurred!'));
                } else {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!["items"].length,
                      itemBuilder: (context, index) {
                        var lesson = snapshot.data!["items"][index];
                        return ProgramCard(
                          image: Image.asset("assets/lady_image.jpeg"),
                          programName: lesson["name"],
                          programType: lesson["category"],
                          bottomInfo:
                              "${DateTime.parse(lesson["createdAt"].toString().substring(0, 10)).day} ${getMonthInWords(DateTime.parse(lesson["createdAt"].toString().substring(0, 10)).month)}, ${getDayOfWeek(DateTime.parse(lesson["createdAt"].toString().substring(0, 10)).weekday)}",
                          bottomWidget: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(48, 24),
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
                        );
                      },
                    );
                  } else {
                    // Handle the case where there's no data
                    return Center(child: Text('No data found!'));
                  }
                }
              },
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
          SizedBox(
            height: 290,
            child: FutureBuilder(
              future: fetchLessons(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('An error occurred!'));
                } else {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!["items"].length,
                      itemBuilder: (context, index) {
                        var lesson = snapshot.data!["items"][index];
                        return ProgramCard(
                          image: Image.asset("assets/lady_image.jpeg"),
                          programName: lesson["name"],
                          programType: lesson["category"],
                          bottomInfo: "${lesson["duration"]} min",
                          bottomWidget: SvgPicture.asset(
                            "assets/lock.svg",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  } else {
                    // Handle the case where there's no data
                    return Center(child: Text('No data found!'));
                  }
                }
              },
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
