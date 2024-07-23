import 'package:flutter/material.dart';

class SetPickupWidget extends StatefulWidget {
  final bool darkMode;

  const SetPickupWidget({
    Key? key,
    required this.darkMode,
  }) : super(key: key);

  @override
  _SetPickupWidgetState createState() => _SetPickupWidgetState();
}

class _SetPickupWidgetState extends State<SetPickupWidget> {
  String? _selectedPickupLocation;
  String? _selectedDestination;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> locations = [
    'Location 1',
    'Location 2',
    'Location 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14), // Space between title and input fields
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Pickup Location',
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                color: widget.darkMode ? Colors.white70 : Colors.black54,
              ),
              filled: true,
              fillColor: widget.darkMode ? Colors.grey[800] : Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(
                Icons.location_on,
                color: widget.darkMode ? Colors.white70 : Colors.black54,
              ),
            ),
            value: _selectedPickupLocation,
            items: locations.map((String location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedPickupLocation = newValue;
              });
            },
            style:
                TextStyle(color: widget.darkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 14), // Space between fields
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Destination',
              labelStyle: TextStyle(
                fontFamily: 'Poppins',
                color: widget.darkMode ? Colors.white70 : Colors.black54,
              ),
              filled: true,
              fillColor: widget.darkMode ? Colors.grey[800] : Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(
                Icons.flag,
                color: widget.darkMode ? Colors.white70 : Colors.black54,
              ),
            ),
            value: _selectedDestination,
            items: locations.map((String location) {
              return DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDestination = newValue;
              });
            },
            style:
                TextStyle(color: widget.darkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 14), // Space between fields
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: widget.darkMode ? Colors.white70 : Colors.black54,
                    ),
                    filled: true,
                    fillColor:
                        widget.darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: widget.darkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  style: TextStyle(
                      color: widget.darkMode ? Colors.white : Colors.black),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                        : '',
                  ),
                ),
              ),
              const SizedBox(width: 14), // Space between fields
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Select Time',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: widget.darkMode ? Colors.white70 : Colors.black54,
                    ),
                    filled: true,
                    fillColor:
                        widget.darkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      Icons.access_time,
                      color: widget.darkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  style: TextStyle(
                      color: widget.darkMode ? Colors.white : Colors.black),
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: _selectedTime != null
                        ? _selectedTime!.format(context)
                        : '',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14), // Space between fields and button
          ElevatedButton(
            onPressed: () {
              // Handle pickup set action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 147, 112, 219),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Center(
              child: Text(
                'Set Pickup',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
