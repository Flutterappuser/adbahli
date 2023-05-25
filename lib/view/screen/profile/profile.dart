import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // GestureDetector(
            //   onTap: getImage,
            //   child: CircleAvatar(
            //     radius: 70,
            //     backgroundImage: _image != null
            //         ? FileImage(_image!) as ImageProvider<Object>?
            //         : AssetImage('assets/profile_image.jpg'),
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Photographer | Traveler | Dreamer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit email functionality
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 123 456 7890'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit phone functionality
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Passionate about capturing moments and creating visual stories. I believe in the power of photography to preserve memories and evoke emotions. When I\'m not behind the camera, you can find me exploring new places and discovering the beauty of the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
