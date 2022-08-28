import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

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

  List? _result;
  String? _confidence = "";
  String? _name = "";
  String? numbers = "";

  _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if(_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
      labels: "assets/labels.txt",
      model: "assets/bird_classifier.tflite"
    );
    print("Result after loading the model: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 400,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5
    );

    setState(() {
      _result = res;
      String? str = _result?[0]["label"];
      _name = str?.substring(2);
      _confidence = _result != null ? (_result?[0]["confidence"] * 100.0).toString().substring(0, 2) + "%": "";
      print("Name: $_name\nConfidence: $_confidence");
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bird Classifier"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50),
            _pickedFile != null
            ? Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(_pickedFile!.path)),
                    fit: BoxFit.contain
                  ),
                ),

              ),
            )
                : Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  height: 350,
                  width: 350,
                  color: Colors.grey[300],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Please select and image"),
                  ),
            ),
            Text("Name:$_name\nConfidence: $_confidence"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage();
          applyModelOnImage(File(_pickedFile!.path));
        },
        child: Icon(Icons.photo_album),
      ),
    );
  }
}
