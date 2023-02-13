import 'package:farmadvisor/screens/models/sensor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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

      // print(Farm.fromJson(json.decode(res.body)).id);
      if (res.statusCode != 400 &&
          res.statusCode != 404 &&
          res.statusCode != 401 &&
          res.statusCode != 500) {
        // ignore: use_build_context_synchronously
        context.go("/dashboard");
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "NEW SENSOR",
            style: TextStyle(
              color: Color.fromARGB(95, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 165, 176, 172),
            ),
            onPressed: () {
              context.go('/sensorHome');
            },
          )),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              child: Text("create new sensor",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 60, 41))),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('sensor name'),
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
                decoration: const InputDecoration(
                  labelText: "sensor name",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('serialNumber'),
                controller: TextEditingController(text: sensor.serialNumber),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  sensor.serialNumber = value;
                },
                validator: (value) => SerialValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Serial number",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('sensor   location'),
                controller: TextEditingController(text: sensor.location),
                onChanged: (value) {
                  sensor.location = value;
                },
                validator: (value) => LocationValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "sensor location",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('GGD'),
                controller: TextEditingController(text: sensor.GGD),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  sensor.GGD = value;
                },
                validator: (value) => GDDValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Default GDD",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('installationDate'),
                controller:
                    TextEditingController(text: sensor.installationDate),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  sensor.installationDate = value;
                },
                validator: (value) => DateValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Initial Date",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('lastCutting'),
                controller: TextEditingController(text: sensor.lastCutting),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  sensor.lastCutting = value;
                },
                validator: (value) => CuttingValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Last cutting date in the field",
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  key: const ValueKey('addsensor'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(formValid
                          ? const Color(0xFF275342)
                          : const Color(0xFF275342)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 140))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      save();
                    }
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
