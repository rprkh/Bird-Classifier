import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if(_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bird Classifier'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(children: [
            Center(
              child: GestureDetector(
                child: const Text(
                    'Click to Select an image',
                    style: TextStyle(fontSize: 20),
                ),
                onTap: ()=>_pickImage(),
              ),
            ),
            const SizedBox(height: 35),
            Container(
              alignment: Alignment.center,
              color: Colors.grey[300],
              width: 300,
              height: 300,
              child: _pickedFile != null
                ? Image.file(
                File(_pickedFile!.path),
                width: 300,
                height: 300,
                fit: BoxFit.cover
              )
                  : const Text('Please select an image'),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Image must be of dimensions 150 x 150 x 3'),
          ])
        )
      )
    );
  }
}
