// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:vit_auto_booking/navigation_menu.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;
    final theme = Theme.of(context);
    final backgroundColor = darkMode ? Colors.grey[900] : Colors.white;
    final textColor = darkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, theme),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NavigationMenu(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: darkMode ? Colors.black : Colors.white,
                backgroundColor: darkMode
                    ? const Color.fromARGB(255, 147, 112, 219)
                    : const Color.fromARGB(255, 147, 112, 219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: TextStyle(color: darkMode ? Colors.white : Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, ThemeData theme) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? (darkMode
                ? const Color.fromARGB(255, 147, 112, 219)
                : const Color.fromARGB(255, 147, 112, 219))
            : (darkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Welcome to VIT tuk tuk',
      image: 'assets/onBoarding/Auto Rickshaw.gif',
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "),
  OnboardingContent(
      title: 'Go home any time',
      image: 'assets/onBoarding/Auto Rickshaw.gif',
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "),
  OnboardingContent(
      title: 'Please kill me',
      image: 'assets/onBoarding/Auto Rickshaw.gif',
      description:
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "),
];
