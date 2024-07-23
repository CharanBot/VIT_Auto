import 'package:flutter/material.dart';
import 'package:vit_auto_booking/features/shop/home/widgets/destination_suggetions.dart';
import 'package:vit_auto_booking/features/shop/home/widgets/searchBar.dart';
import 'package:vit_auto_booking/features/shop/home/widgets/set_pickup.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    // Dummy user data
    const String userName = "Naga Charan";
    const String userPhoneNumber = "+91-7207262274";
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 14), // Space above the welcome message
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Welcome, ',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 147, 112, 219),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: userName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: darkMode
                                            ? Colors.white
                                            : Colors.black, // User name color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    4), // Space between name and phone number
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                userPhoneNumber,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: darkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.question_answer),
                          // color: darkMode ? Colors.white : Colors.black,
                          color: const Color.fromARGB(255, 147, 112, 219),
                          onPressed: () {
                            // Use the goToChats method to navigate to the ChatScreen
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                        height:
                            14), // Space between the welcome message and the search box
                    SearchContainer(darkMode: darkMode),
                    const SizedBox(height: 14),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Ride Suggetions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: darkMode ? Colors.white : Colors.black,
                          color: Color.fromARGB(255, 147, 112, 219),
                          fontFamily: 'Poppins', // Custom font family
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Add some space below the heading
                    const suggetions(),
                    const SizedBox(
                        height: 14), // space between suggestions and set ride
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Schedule Future Pickup',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: darkMode ? Colors.white : Colors.black,
                          color: Color.fromARGB(255, 147, 112, 219),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SetPickupWidget(darkMode: darkMode),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
