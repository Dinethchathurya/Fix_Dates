import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSyncEnabled = false; // Initialize with default value
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
        'Time Format',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(height: 8),
      _buildTimeFormatDropdown(),
      SizedBox(height: 24),
      Row(
        children: [
          Text(
            'Date and Time Sync',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 8),
          Switch(
            value: isSyncEnabled,
            onChanged: (value) {
              // Handle synchronization toggle
              isSyncEnabled = value;
            },
          ),
        ],
      ),
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
        hintText: 'Select Date Format',
      ),
    );
  }
  Widget _buildTimeFormatDropdown() {
    // Replace the list of time formats with your own options
    List<String> timeFormats = ['12-hour', '24-hour'];

    return DropdownButtonFormField<String>(
      items: timeFormats.map((String format) {
        return DropdownMenuItem<String>(
          value: format,
          child: Text(format),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle time format change
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select Time Format',
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
        hintText: 'Select Time Zone',
      ),
    );
  }
}



