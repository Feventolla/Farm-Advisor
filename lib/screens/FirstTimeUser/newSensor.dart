import 'package:farmadvisor/screens/models/sensor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GDDValidator {
  static validate(value) {
    return value.isEmpty ? 'phone can not be empty' : null;
  }
}

class LocationValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class DateValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class SerialValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class CuttingValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class NewSensor extends StatefulWidget {
  final String? id;
  const NewSensor({Key? key, this.id}) : super(key: key);

  @override
  State<NewSensor> createState() => _NewSensorState();
}


class _NewSensorState extends State<NewSensor> {
  final formKey = GlobalKey<FormState>();
  bool formValid = false;

  Sensor sensor = Sensor(
      GGD: '',
      name: '',
      installationDate: '',
      lastCutting: '',
      location: '',
      serialNumber: '');
  @override
  Widget build(BuildContext context) {
    Future save() async {
      final prefs = await SharedPreferences.getInstance();
      final farmId = prefs.getString('farmId') ?? 0;

      final token = prefs.getString('token') ?? 0;
      var res = await http.post(
          Uri.parse("https://quaint-kerchief-crab.cyclic.app/sensor"),
          headers: {
            'Authorization': 'Bearer $token',
            "content-type": "application/json",
          },
          body: json.encode({
            'name': sensor.name,
            'GGD': sensor.GGD,
            'installationDate': sensor.installationDate,
            'lastCutting': sensor.lastCutting,
            'location': sensor.location,
            'serialNumber': sensor.serialNumber,
            'farm': farmId,
            'field': widget.id

            // 'email': user.email,
            // 'password': user.password
          }));
      // final id = Sensor.fromJson(json.decode(res.body)).id;
      // prefs.setString('farmId', id);
      print(res.body);

      // print(Farm.fromJson(json.decode(res.body)).id);
      if (res.statusCode != 400 &&
          res.statusCode != 404 &&
          res.statusCode != 401 &&
          res.statusCode != 500) {
        context.go("/dashboard");
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "NEW SENSOR",
            style: TextStyle(
              color: Color.fromARGB(95, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

         // Padding(
           // padding: EdgeInsets.all(20),
            //child: TextFormField(
              //decoration: InputDecoration(
                //border: OutlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(10))),
                //filled: true,
                //fillColor: Colors.white,
                //hintText: "Farm Name 1",
                //hintStyle: TextStyle(color: Colors.grey),
              //),
            //),
          //),
          //Padding(
            //padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
            //child: Container(
              //child: Text("Field"),
            //  alignment: Alignment.topLeft,

          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 165, 176, 172),

            ),
            onPressed: () {
              context.go('/sensorHome');
            },
          )),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
                  child: Text("create new sensor",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 22, 60, 41))),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('name'),
                  controller: TextEditingController(text: sensor.name),
                  onChanged: (value) {
                    sensor.name = value;
                  },
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onChanged: (value) {
                  //   if (value != null && value.length < 8) {
                  //     setState(() {
                  //       formValid = false;
                  //     });
                  //     // return "Enter a valid number";
                  //   } else {
                  //     setState(() {
                  //       user.phone = value;


                  //       formValid = true;
                  //     });
                  //     // return null;
                  //   }
                  // },
                  validator: (value) => LocationValidator.validate(value),

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "sensor name",
                  ),
                ),

              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('serialNumber'),
                  controller: TextEditingController(text: sensor.serialNumber),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    sensor.serialNumber = value;
                    // if (value != null && value.length < 8) {
                    //   setState(() {
                    //     formValid = false;
                    //   });
                    //   // return "Enter a valid number";
                    // } else {
                    //   setState(() {
                    //     print(value);
                    //     user.country = value;

                    //     formValid = true;
                    //   });
                    //   // return null;
                    // }
                  },
                  validator: (value) => SerialValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Serial number",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('location'),
                  controller: TextEditingController(text: sensor.location),
                  onChanged: (value) {
                    sensor.location = value;
                  },
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onChanged: (value) {
                  //   if (value != null && value.length < 8) {
                  //     setState(() {
                  //       formValid = false;
                  //     });
                  //     // return "Enter a valid number";
                  //   } else {
                  //     setState(() {
                  //       user.phone = value;

                  //       formValid = true;
                  //     });
                  //     // return null;
                  //   }
                  // },
                  validator: (value) => LocationValidator.validate(value),


                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "sensor location",
                  ),
                ),

              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('GGD'),
                  controller: TextEditingController(text: sensor.GGD),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    sensor.GGD = value;
                    // if (value != null && value.length < 8) {
                    //   setState(() {
                    //     formValid = false;
                    //   });
                    //   // return "Enter a valid number";
                    // } else {
                    //   setState(() {
                    //     print(value);
                    //     user.country = value;


                    //     formValid = true;
                    //   });
                    //   // return null;
                    // }
                  },
                  validator: (value) => GDDValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Default GDD",
                  ),
                ),

              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('installationDate'),
                  controller:
                      TextEditingController(text: sensor.installationDate),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    sensor.installationDate = value;
                    // if (value != null && value.length < 8) {
                    //   setState(() {
                    //     formValid = false;
                    //   });
                    //   // return "Enter a valid number";
                    // } else {
                    //   setState(() {
                    //     print(value);
                    //     user.country = value;

                    //     formValid = true;
                    //   });
                    //   // return null;
                    // }
                  },
                  validator: (value) => DateValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Initial Date",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('lastCutting'),
                  controller: TextEditingController(text: sensor.lastCutting),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    sensor.lastCutting = value;
                    // if (value != null && value.length < 8) {
                    //   setState(() {
                    //     formValid = false;
                    //   });
                    //   // return "Enter a valid number";
                    // } else {
                    //   setState(() {
                    //     print(value);
                    //     user.country = value;


                    //     formValid = true;
                    //   });
                    //   // return null;
                    // }
                  },
                  validator: (value) => CuttingValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Last cutting date in the field",
                  ),
                ),

              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(formValid ? Color(0xFF275342): Color(0xFF275342)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 140))
                    ),   
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        save();
                      }
                    },
                    child: const Text(
                      'Create',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      // SafeArea(
      //     child: ListView(
      //   children: [
      //     SizedBox(height: 20),

      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("sensor"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "Farm Name 1",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("Field"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "Field name 1",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),

      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("Serial Number"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "Scan or enter serial number",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //       child: Container(child: Text("sensor Location")),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      //       child: Container(
      //         width: double.infinity,
      //         height: 45,
      //         child: Card(
      //           child: Text("field name"),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      //       child: Card(
      //         child: Image(
      //           image: AssetImage("assets/pingu.jpg"),
      //         ),
      //       ),
      //     ),

      //     // default GGD

      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("Default GGD"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "456",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),

      //     // sensor intialization dat
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("sensor initialization date"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "3",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),

      //     // last cutting date

      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
      //       child: Container(
      //         child: Text("Last Cutting Date In This Field"),
      //         alignment: Alignment.topLeft,
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(20),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           // border: OutlineInputBorder(
      //           //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //           filled: true,
      //           fillColor: Colors.white,
      //           hintText: "select date",
      //           hintStyle: TextStyle(color: Colors.grey),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(30.0),
      //       child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               minimumSize: Size(351, 48),
      //               primary: Color.fromARGB(255, 44, 93, 75),
      //               elevation: 3),
      //           onPressed: () => {context.go('/dashboard')},
      //           child: Text("ADD NEW SENSOR")),
      //     )
      //   ],
      // )),
    );
  }
}
