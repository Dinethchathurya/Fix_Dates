import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Settings'),
    ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Date Format',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),
    ),
    SizedBox(height: 8),
    _buildDateFormatDropdown(),
    SizedBox(height: 24),
    Text(
    'Time Zone',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    ),
    ),
      SizedBox(height: 8),
      _buildTimezoneDropdown(),
    ],
    ),
    ),
    );
  }

  Widget _buildDateFormatDropdown() {
    // Replace the list of date formats with your own options
    List<String> dateFormats = ['DD/MM/YYYY', 'MM/DD/YYYY', 'YYYY-MM-DD'];

    return DropdownButtonFormField<String>(
      items: dateFormats.map((String format) {
        return DropdownMenuItem<String>(
          value: format,
          child: Text(format),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle date format change
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select date format',
      ),
    );
  }
  Widget _buildTimezoneDropdown() {
    // Replace the list of timezones with your own options
    List<String> timezones = [
      'GMT',
      'UTC',
      'EST',
      'CST',
      'PST',
    ];

    return DropdownButtonFormField<String>(
      items: timezones.map((String timezone) {
        return DropdownMenuItem<String>(
          value: timezone,
          child: Text(timezone),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle timezone change
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select timezone',
      ),
    );
  }
}



