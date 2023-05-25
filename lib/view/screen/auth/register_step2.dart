import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InformationCompletionScreen extends StatefulWidget {
  @override
  _InformationCompletionScreenState createState() =>
      _InformationCompletionScreenState();
}

class _InformationCompletionScreenState
    extends State<InformationCompletionScreen> {
  File? _profileImage;
  final _imagePicker = ImagePicker();

  String? _selectedCity;
  String? _selectedStreet;
  bool _isCitySelected = false;

  List<String> _cities = [
    'City 1',
    'City 2',
    'City 3',
  ];
  Map<String, List<String>> _cityStreetMap = {
    'City 1': ['Street 1-1', 'Street 1-2', 'Street 1-3'],
    'City 2': ['Street 2-1', 'Street 2-2', 'Street 2-3'],
    'City 3': ['Street 3-1', 'Street 3-2', 'Street 3-3'],
  };

  Future _pickProfileImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profileImage = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null ? Icon(Icons.camera_alt) : null,
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              items: _cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCity = newValue;
                  _selectedStreet = null;
                  _isCitySelected = true;
                });
              },
              decoration: InputDecoration(
                labelText: 'City',
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedStreet,
              items: _isCitySelected
                  ? _cityStreetMap[_selectedCity!]!.map((String street) {
                      return DropdownMenuItem<String>(
                        value: street,
                        child: Text(street),
                      );
                    }).toList()
                  : null,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStreet = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Street',
              ),
              disabledHint: Text('Select a city first'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your logic to save the information and navigate to the next screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
