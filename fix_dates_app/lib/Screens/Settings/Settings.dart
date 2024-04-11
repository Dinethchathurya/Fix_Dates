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

    body: SingleChildScrollView(
    child: Padding(
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
            activeColor: Colors.blue, // Set the active color to blue
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

      SizedBox(height: 24),
Text(
  'Language Preferences',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
),
SizedBox(height: 8),
_buildLanguageDropdown(),

SizedBox(height: 24),
_buildNotificationSettings(),
 SizedBox(height: 24),
            Text(
              'Backup and Restore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildBackupRestoreButtons(),
             SizedBox(height: 24),
            Text(
              'Privacy Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            _buildPrivacySettings(),
    SizedBox(height: 24),
              Text(
                'Help & Support Center',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              _buildHelpAndSupportButton(),
    ],
    ),
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
  Widget _buildLanguageDropdown() {
  // Replace the list of languages with your own options
  List<String> languages = ['English', 'Sinhala'];

  return DropdownButtonFormField<String>(
    items: languages.map((String language) {
      return DropdownMenuItem<String>(
        value: language,
        child: Text(language),
      );
    }).toList(),
    onChanged: (String? value) {
      // Handle language change
      // You can implement logic here to change the language of the app
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Select Language',
    ),
  );
}
Widget _buildNotificationSettings() {
  bool notificationsEnabled = false; // Initialize with default value

  return Row(
    children: [
      Text(
        'Notification Settings',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      SizedBox(width: 8),
      Switch(
        value: notificationsEnabled,
        onChanged: (value) {
          // Handle notification toggle
          notificationsEnabled = value;
        },
        activeColor: Colors.blue, // Set the active color to blue
      ),
    ],
  );
}
 Widget _buildBackupRestoreButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle backup logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 3, 244, 224), // Light blue color for backup button
          ),
          child: Text('Backup'),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle restore logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 3, 244, 224), // Light blue color for backup button
          ),
          child: Text('Restore'),
        ),
      ],
    );
  }
 Widget _buildPrivacySettings() {
    bool anonymousDataCollection = false; // Initialize with default value

    return Row(
      children: [
        Text(
          'Anonymous Data Collection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 8),
        Switch(
          value: anonymousDataCollection,
          onChanged: (value) {
            // Handle anonymous data collection toggle
            anonymousDataCollection = value;
          },
          activeColor: Colors.blue, // Set the active color to blue
        ),
      ],
    );
  }
Widget _buildHelpAndSupportButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the help and support screen
        // You can use Navigator to push a new screen for help and support
      },
      child: Text('Visit Help & Support'),
    );
  }
}



