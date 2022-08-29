import 'package:flutter/material.dart';

class ModelArchitecture extends StatefulWidget {
  const ModelArchitecture({Key? key}) : super(key: key);

  @override
  State<ModelArchitecture> createState() => _ModelArchitectureState();
}

class _ModelArchitectureState extends State<ModelArchitecture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Model Architecture",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Model Used: ",
                  style: TextStyle(
                    color: Colors.amberAccent[200],
                    fontSize: 20,
                  ),
                ),
                Text(
                  "MobileNetV2",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Number of Epochs: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "20",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Batch Size: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "64",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Neural Network Architecture",
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 500,
              height: 500,
              child: Image(
                image: AssetImage("images/model_architecture.png"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Model Performance",
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              height: 400,
              child: Image(
                image: AssetImage("images/model_accuracy.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Model Accuracy",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 400,
              height: 400,
              child: Image(
                image: AssetImage("images/model_loss.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Model Loss",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]
        ),
      ),
    );
  }
}
