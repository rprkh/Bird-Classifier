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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            "Bird Classifier",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
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
                  color: Colors.grey[600],
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Please select an image"),
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Name: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                Text(
                  "$_name",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Confidence: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                Text(
                  "$_confidence",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
           ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              minWidth: 200,
              onPressed: () {
                applyModelOnImage(File(_pickedFile!.path));
              },
              child: Text(
                  "Predict",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Data Used",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Model Architecture",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage();
        },
        child: Icon(Icons.photo_album),
        backgroundColor: Colors.amberAccent[400],
      ),
    );
  }
}
