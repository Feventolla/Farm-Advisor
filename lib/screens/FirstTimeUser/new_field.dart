import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/field.dart';

class NameValidator {
  static validate(value) {
    return value.isEmpty ? 'phone can not be empty' : null;
  }
}

class LocationValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class NewField extends StatefulWidget {
  const NewField({Key? key}) : super(key: key);

  @override
  State<NewField> createState() => _NewFieldState();
}


class _NewFieldState extends State<NewField> {
  final formKey = GlobalKey<FormState>();
  bool formValid = false;


  @override
  Widget build(BuildContext context) {
    Field field = Field(
      altitude: '',
      fieldName: '',
      id: '',
    );

    Future save() async {
      final prefs = await SharedPreferences.getInstance();
      final farmId = prefs.getString('farmId') ?? 0;
      final token = prefs.getString('token') ?? 0;

      var res = await http.post(
          Uri.parse("https://quaint-kerchief-crab.cyclic.app/field"),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json'
          },
          body: json.encode({
            'name': field.fieldName,
            'attitude': field.altitude,
            'farm': farmId,
          }));

      if (res.statusCode == 200 || res.statusCode == 201) {
        var id = json.decode(res.body)['_id'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('fieldId', id);
        // ignore: use_build_context_synchronously
        context.go('/sensorHome');
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "NEW FIELD",
            style: TextStyle(
              color: Color.fromARGB(95, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 165, 176, 172),
            ),
            onPressed: () {
              context.go('/fieldhome');
            },
          )),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              child: Text("create new field",
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
                key: const ValueKey('fieldName'),
                controller: TextEditingController(text: field.fieldName),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  field.fieldName = value;
                },
                validator: (value) => NameValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Field name",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('altitude'),
                controller: TextEditingController(text: field.altitude),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  field.altitude = value;
                },
                validator: (value) => NameValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Field altitude",
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    save();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 22, 60, 41),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                  ),
                  child: const Text('Create'),

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


