import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> onboardingData = [];

  //Feach data to the file
  Future<void> readJson() async {
    String responce =
        await rootBundle.loadString('assets/files/onboardingdata.json');
    // print(responce);
    final data = json.decode(responce);
    setState(() {
      onboardingData = List<Map<String, dynamic>>.from(data['onboardingData']);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(70),
                  //   ),
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                    child: Image.network(
                      onboardingData[index]['imageurl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "MEET UP",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade300,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  onboardingData[index]['title'],
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink.shade200,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    onboardingData[index]['disc'],
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade200),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
