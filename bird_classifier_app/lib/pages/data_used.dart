import 'package:flutter/material.dart';

class DataUsed extends StatefulWidget {
  const DataUsed({Key? key}) : super(key: key);

  @override
  State<DataUsed> createState() => _DataUsedState();
}

class _DataUsedState extends State<DataUsed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Used"),
      ),
      body: SafeArea(
        child: Text(
          "Data Used",
        ),
      ),
    );
  }
}
