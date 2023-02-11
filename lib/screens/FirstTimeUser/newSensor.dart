import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class newSensor extends StatelessWidget {
  const newSensor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Sensor"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Serial Number"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "Scan or enter serial number",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Container(child: Text("sensor Location")),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Container(
              width: double.infinity,
              height: 45,
              child: Card(
                child: Text("field name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Card(
              child: Image(
                image: AssetImage("assets/pingu.jpg"),
              ),
            ),
          ),

          // default GGD

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Default GGD"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "456",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          // sensor intialization dat
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("sensor initialization date"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "3",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          // last cutting date

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Last Cutting Date In This Field"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "select date",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(351, 48),
                    primary: Color.fromARGB(255, 44, 93, 75),
                    elevation: 3),
                onPressed: () => {},
                child: Text("ADD NEW SENSOR")),
          )
        ],
      )),
    );
  }
}
