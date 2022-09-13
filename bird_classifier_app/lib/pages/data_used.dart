import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            "Data Used",
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
                    "Number of Classes: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    )
                ),
                Text(
                  "400",
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
                    "Training Set Size: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    )
                ),
                Text(
                  "58,388 Images",
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
                    "Validation Set Size: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    )
                ),
                Text(
                  "2,000 Images",
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
                    "Testing Set Size: ",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontSize: 20,
                    )
                ),
                Text(
                  "2,000 Images",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Image from the Train Set",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                ),
              ]
            ),
            SizedBox(
              height: 15,
            ),
            Image(
              image: AssetImage("images/harlequin_duck.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Label: Harlequin Duck",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                   ),
                  ),
                ]
            ),
            SizedBox(
              height: 25,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Image from the Validation Set",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 15,
            ),
            Image(
              image: AssetImage("images/abyssinian_ground_hornbill.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Label: Abyssinian Ground Hornbill",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 25,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Image from the Test Set",
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ]
            ),
            SizedBox(
              height: 15,
            ),
            Image(
              image: AssetImage("images/african_emerald_cuckoo.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Label: African Emerald Cuckoo",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ]
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
