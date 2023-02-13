import 'dart:convert';
import 'package:farmadvisor/screens/models/farm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

class NewFarm extends StatefulWidget {
  const NewFarm({Key? key}) : super(key: key);

  @override
  State<NewFarm> createState() => _NewFarmState();
}


class _NewFarmState extends State<NewFarm> {
  final formKey = GlobalKey<FormState>();
  bool formValid = false;


  @override
  Widget build(BuildContext context) {
    Farm farm = Farm(name: '', location: '', id: '');

    Future save() async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? 0;
      var res = await http.post(
          Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm"),
          headers: {
            'Authorization': 'Bearer $token',
            "content-type": "application/json",
          },
          body: json.encode({
            'name': farm.name,
            'location': farm.location,
            // 'email': user.email,
            // 'password': user.password
          }));
      final id = Farm.fromJson(json.decode(res.body)).id;
      prefs.setString('farmId', id);
      

      // print(Farm.fromJson(json.decode(res.body)).id);
      if (res.statusCode != 400 &&
          res.statusCode != 404 &&
          res.statusCode != 401 &&
          res.statusCode != 500) {
        context.go("/fieldHome");
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "NEW FARM",
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
              context.go('/home');
            },
          )),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              child: Text("create new farm",
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
                key: const ValueKey('name'),
                controller: TextEditingController(text: farm.name),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  farm.name = value;
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
                validator: (value) => NameValidator.validate(value),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Farm name",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                key: const ValueKey('location'),
                controller: TextEditingController(text: farm.location),
                onChanged: (value) {
                  farm.location = value;
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
                  labelText: "location",
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      save();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 22, 60, 41),
                    onPrimary: Colors.white,
                    minimumSize: const Size(140, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Create'),
                  // color: Color(0xFF275342),
                  // textColor: Colors.white,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  // highlightColor: Color.fromARGB(255, 119, 72, 72),
                  // padding:
                  //     EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                  // onPressed: () {
                  //   if (formKey.currentState!.validate()) {
                  //     save();
                  //   }
                  // },
                  // child: const Text(
                  //   'Create',
                  //   style:
                  //       TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  // ),
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



// import 'dart:convert';

// import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
// import 'package:farmadvisor/screens/Onboarding/termspage.dart';
// import 'package:farmadvisor/screens/models/farm.dart';
// import 'package:farmadvisor/screens/models/user.dart';
// import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:go_router/go_router.dart';
// import 'package:http/http.dart' as http;
// import 'package:localstorage/localstorage.dart';

// class NameValidator {
//   static validate(value) {
//     return value.isEmpty ? 'phone can not be empty' : null;
//   }
// }

// class LocationValidator {
//   static validate(value) {
//     return value.isEmpty ? 'country can not be empty' : null;
//   }
// }

// class NewFarm extends StatefulWidget {
//   const NewFarm({Key? key}) : super(key: key);

//   @override
//   State<NewFarm> createState() => _NewFarmState();
// }

// class _NewFarmState extends State<NewFarm> {
//   final formKey = GlobalKey<FormState>();
//   bool formValid = false;

//   @override
//   Widget build(BuildContext context) {
//     final LocalStorage storage = new LocalStorage('localstorage_app');
//     Farm farm = Farm(name: '', location: '', id: '');

//     Future save() async {
//       final token = storage.getItem('token');
//       var res = await http.post(
//           Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm"),
//           headers: {
//             'Authorization': 'Bearer $token',
//             "content-type": "application/json",
//           },
//           body: json.encode({
//             'name': farm.name,
//             'location': farm.location,
//             // 'email': user.email,
//             // 'password': user.password
//           }));
//       final id = Farm.fromJson(json.decode(res.body)).id;
//       storage.setItem('id', id);
//       print(storage.getItem('id'));
//       print(res.body);
//       // print(Farm.fromJson(json.decode(res.body)).id);
//       if (res.statusCode != 400 &&
//           res.statusCode != 404 &&
//           res.statusCode != 401 &&
//           res.statusCode != 500) {
//         context.go("/fieldHome");
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//             "NEW FARM",
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
//               context.go('/home');
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
//                   child: Text("create new farm",
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
//                   key: ValueKey('name'),
//                   controller: TextEditingController(text: farm.name),
//                   // autovalidateMode: AutovalidateMode.onUserInteraction,
//                   onChanged: (value) {
//                     farm.name = value;
//                     // if (value != null && value.length < 8) {
//                     //   setState(() {
//                     //     formValid = false;
//                     //   });
//                     //   // return "Enter a valid number";
//                     // } else {
//                     //   setState(() {
//                     //     print(value);
//                     //     user.country = value;

//                     //     formValid = true;
//                     //   });
//                     //   // return null;
//                     // }
//                   },
//                   validator: (value) => NameValidator.validate(value),
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     labelText: "Farm name",
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 padding: EdgeInsets.only(left: 8, right: 8),
//                 child: TextFormField(
//                   key: ValueKey('location'),
//                   controller: TextEditingController(text: farm.location),
//                   onChanged: (value) {
//                     farm.location = value;
//                   },
//                   // autovalidateMode: AutovalidateMode.onUserInteraction,
//                   // onChanged: (value) {
//                   //   if (value != null && value.length < 8) {
//                   //     setState(() {
//                   //       formValid = false;
//                   //     });
//                   //     // return "Enter a valid number";
//                   //   } else {
//                   //     setState(() {
//                   //       user.phone = value;

//                   //       formValid = true;
//                   //     });
//                   //     // return null;
//                   //   }
//                   // },
//                   validator: (value) => LocationValidator.validate(value),

//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     labelText: "location",
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: RaisedButton(
//                     color: Color(0xFF275342),
//                     textColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     highlightColor: Color.fromARGB(255, 119, 72, 72),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 140),
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         save();
//                       }
//                     },
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
