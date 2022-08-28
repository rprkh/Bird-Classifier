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
      appBar: AppBar(
        title: Text("Model Architecture"),
      ),
      body: SafeArea(
        child: Text(
          "Model Architecture",
        ),
      ),
    );
  }
}
