import 'dart:convert';

import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:farmadvisor/screens/models/user.dart';
import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    Field field = new Field(
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

      print(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        var id = json.decode(res.body)['_id'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('fieldId', id);
        context.go('/sensorHome');
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "NEW FIELD",
            style: TextStyle(
              color: Color.fromARGB(95, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 165, 176, 172),
            ),
            onPressed: () {
              context.go('/fieldhome');
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
                  child: Text("create new field",
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
                  key: ValueKey('fieldName'),
                  controller: TextEditingController(text: field.fieldName),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    field.fieldName = value;
                  },
                  validator: (value) => NameValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Field name",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('altitude'),
                  controller: TextEditingController(text: field.altitude),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    field.altitude = value;
                  },
                  validator: (value) => NameValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Field altitude",
                  ),
                ),
              ),
              Expanded(
                key: ValueKey('addfield'),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      save();
                    },
                    child: Text('Create'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 22, 60, 41),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                    ),

                    // color: formValid
                    //     ? Color(0xFF275342)
                    //     : Color.fromARGB(255, 213, 223, 219),
                    // textColor: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // highlightColor: Color.fromARGB(255, 119, 72, 72),
                    // padding:
                    //     EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                    // onPressed: formValid
                    //     ? () {
                    //         final isValidForm =
                    //             formKey.currentState!.validate();
                    //         if (isValidForm) {
                    //           context.go('/sensorHome');
                    //         }
                    //       }
                    //     : null,
                    // child: const Text(
                    //   'Create',
                    //   style:
                    //       TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    // ),
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
    );
  }
}


// import 'dart:convert';

// import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
// import 'package:farmadvisor/screens/Onboarding/termspage.dart';
// import 'package:farmadvisor/screens/models/user.dart';
// import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:go_router/go_router.dart';
// import 'package:http/http.dart' as http;

// class NewField extends StatefulWidget {
//   const NewField({Key? key}) : super(key: key);

//   @override
//   State<NewField> createState() => _NewFieldState();
// }

// class _NewFieldState extends State<NewField> {
//   final formKey = GlobalKey<FormState>();
//   bool formValid = false;

//   @override
//   Widget build(BuildContext context) {
//     // User user = User(country: '', phonenumber: '');

//     Future save() async {
//       var res = await http.post(Uri.parse("url"),
//           headers: {'Content-Type': 'application/json'},
//           body: json.encode({
//             // 'country': user.country,
//             // 'phonenumber': user.phonenumber,
//             // 'email': user.email,
//             // 'password': user.password
//           }));
//       print(res.body);
//       if (res.body != null) {
//         context.go("/catagory");
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//             "NEW FIELD",
//             style: TextStyle(
//               color: Color.fromARGB(95, 0, 0, 0),
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color.fromARGB(255, 165, 176, 172),
//             ),
//             onPressed: () {
//               context.go('/fieldhome');
//             },
//           )),
//       body: Container(
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
//                   child: Text("create new field",
//                       style: TextStyle(
//                           fontSize: 23,
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromARGB(255, 22, 60, 41))),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 padding: EdgeInsets.only(left: 8, right: 8),
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   onChanged: (value) {
//                     if (value != null && value.length < 8) {
//                       setState(() {
//                         formValid = false;
//                       });
//                       // return "Enter a valid number";
//                     } else {
//                       setState(() {
//                         formValid = true;
//                       });
//                       // return null;
//                     }
//                   },
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     labelText: "Field Name",
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 padding: EdgeInsets.only(left: 8, right: 8),
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   onChanged: (value) {
//                     if (value != null && value.length < 8) {
//                       setState(() {
//                         formValid = false;
//                       });
//                       // return "Enter a valid number";
//                     } else {
//                       setState(() {
//                         formValid = true;
//                       });
//                       // return null;
//                     }
//                   },
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     labelText: "Altitude above sea level",
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: RaisedButton(
//                     color: formValid
//                         ? Color(0xFF275342)
//                         : Color.fromARGB(255, 213, 223, 219),
//                     textColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     highlightColor: Color.fromARGB(255, 119, 72, 72),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 140),
//                     onPressed: formValid
//                         ? () {
//                             final isValidForm =
//                                 formKey.currentState!.validate();
//                             if (isValidForm) {
//                               context.go('/sensorHome');
//                             }
//                           }
//                         : null,
//                     child: const Text(
//                       'Create',
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
