import 'dart:io';

import 'package:flutter/material.dart';
import 'package:house_rent/model/house.dart';
import 'package:image_picker/image_picker.dart';

class AddHousePage extends StatefulWidget {
  @override
  _AddHousePageState createState() => _AddHousePageState();
}

class _AddHousePageState extends State<AddHousePage> {
  List<House> houseList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? _housePicture;
  TextEditingController contactInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Form for adding house details
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            if (_housePicture != null) ...[
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(_housePicture!),
              ),
              SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Upload house images'),
            ),
            TextField(
              controller: contactInfoController,
              decoration: InputDecoration(
                  labelText: 'Contact Info (e.g., phone number or email)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addProperty,
              child: Text('Add Listing'),
            ),
            SizedBox(height: 16),
            Divider(),
            // Display the list of house listings
            Text(
              'House Listings',
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: houseList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(houseList[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(houseList[index].address),
                        Text('Contact: ${houseList[index].contactInfo}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _housePicture = File(pickedFile.path);
      });
    }
  }

  void _addProperty() {
    setState(() {
      // Check if all required fields are filled
      if (nameController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          _housePicture != null &&
          contactInfoController.text.isNotEmpty) {
        // Create a new House instance
        houseList.add(
          House(
            nameController.text,
            addressController.text,
            _housePicture!.path, // Use _profilePicture!.path to get the file path
            contactInfoController.text,
          ),
        );

        // Clear the controllers for the next input
        nameController.clear();
        addressController.clear();
        contactInfoController.clear();
        _housePicture = null; // Reset the profile picture after adding
      } else {
        // Show a dialog or a snackbar to inform the user to fill in all required fields
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in all fields and upload an image.'),
          ),
        );
      }
    });
  }
}
