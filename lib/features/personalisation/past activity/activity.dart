import 'package:flutter/material.dart';

class PastAutoBookings extends StatelessWidget {
  final bool darkMode;

  const PastAutoBookings({Key? key, required this.darkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bookings = [
      {
        'destination': 'Location 1',
        'dateTime': '12/07/2024, 14:30',
        'cost': '₹150',
      },
      {
        'destination': 'Location 2',
        'dateTime': '10/07/2024, 10:15',
        'cost': '₹200',
      },
      {
        'destination': 'Location 3',
        'dateTime': '05/07/2024, 08:00',
        'cost': '₹100',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Past Auto Bookings',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      ),
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.local_taxi,
                    color: darkMode ? Colors.white70 : Colors.black54,
                  ),
                  title: Text(
                    booking['destination'],
                    style: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking['dateTime'],
                        style: TextStyle(
                            color: darkMode ? Colors.white70 : Colors.black54,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        booking['cost'],
                        style: TextStyle(
                          color: darkMode ? Colors.white70 : Colors.black54,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Handle rebook action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 147, 112, 219),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.replay, // Replay icon inside button
                          color: Colors.white,
                        ),
                        SizedBox(width: 4.0), // Space between icon and text
                        Text(
                          'Rebook',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
              const Divider(
                thickness: 1,
                height: 16,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }
}
