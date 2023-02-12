import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SerialNumberValidator {
  static validate(value) {
    return value.isEmpty ? "serial number can not be empty" : null;
  }
}

class SensorLocationValidator {
  static validate(value) {
    return value.isEmpty ? "sensor location can not be empty" : null;
  }
}

class DefaultGGDValidator {
  static validate(value) {
    return value.isEmpty ? "default GGD can not be empty" : null;
  }
}

class SensorInstallationDateVlidator {
  static validate(value) {
    return value.isEmpty ? "sensor installation date can not be empty" : null;
  }
}

class LastCuttingDateValidator {
  static validate(value) {
    return value.isEmpty ? "last cutting date can not be empty" : null;
  }
}

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
              child: Text("Farm"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "Farm Name 1",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Field"),
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
                hintText: "Field name 1",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Serial Number"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              key: ValueKey('serial number'),
              validator: (value) => SerialNumberValidator.validate(value),
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
            child: TextFormField(
              key: ValueKey('default GGD'),
              validator: (value) => DefaultGGDValidator.validate(value),
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
            child: TextFormField(
              key: ValueKey('sensor initialization date'),
              validator: (value) =>
                  SensorInstallationDateVlidator.validate(value),
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
            child: TextFormField(
              key: ValueKey('Last Cutting Date'),
              validator: (value) => LastCuttingDateValidator.validate(value),
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
