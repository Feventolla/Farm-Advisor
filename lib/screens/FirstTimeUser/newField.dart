import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FieldNameValidator {
  static validate(value) {
    return value.isEmpty ? "field name can not be empty" : null;
  }
}

class AltitudeValidator {
  static validate(value) {
    return value.isEmpty ? "altitude can not be empty" : null;
  }
}

class newField extends StatelessWidget {
  const newField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Feild"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Container(
              child: Text("Field Name"),
              alignment: Alignment.topLeft,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              key: ValueKey('field name'),
              validator: (value) => FieldNameValidator.validate(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter field name",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Container(child: Text("Altitude Above Sea Level")),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              key: ValueKey('altitude'),
              validator: (value) => AltitudeValidator.validate(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter in meters",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(351, 48),
                primary: Color.fromARGB(255, 44, 93, 75),
                elevation: 3),
            onPressed: () => {},
            child: Text("CREATE NEW FIELD"),
          )
        ],
      )),
    );
  }
}
