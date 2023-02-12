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

class PhoneValidator {
  static validate(value) {
    return value.isEmpty ? 'phone can not be empty' : null;
  }
}

class CountryValidator {
  static validate(value) {
    return value.isEmpty ? 'country can not be empty' : null;
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool formValid = false;

  @override
  Widget build(BuildContext context) {
    User user = User(country: '', phone: '', token: '');

    Future save() async {
      var res = await http.post(
          Uri.parse("https://quaint-kerchief-crab.cyclic.app/user/register"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'country': user.country,
            'phone': user.phone,
            // 'email': user.email,
            // 'password': user.password
          }));
      print(res.body);
      if (res.body != null) {
        context.go("/login");
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "SIGN UP",
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
              context.go('/terms');
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
                  child: Text("Sign up with your phone number",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 22, 60, 41))),
                ),
              ),
              SizedBox(height: 10),
              // CountrySelector(),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(

                 

                  key: ValueKey('country'),
                  controller: TextEditingController(text: user.country),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (value) {
                    user.country = value;
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
                  validator: (value) => CountryValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your country",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: ValueKey('phone'),
                  controller: TextEditingController(text: user.phone),
                  onChanged: (value) {
                    user.phone = value;
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
                  validator: (value) => PhoneValidator.validate(value),

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your phone number",
                  ),
                  // validator: (value) => PhoneValidator.validate(value),
                ),
              ),

              // Expanded(
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: RaisedButton(
              //       color: formValid ? Color(0xFF275342): Color.fromARGB(255, 213, 223, 219),
              //       textColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       highlightColor: Color.fromARGB(255, 119, 72, 72),
              //       padding:
              //           EdgeInsets.symmetric(vertical: 15, horizontal: 140),
              //       onPressed:formValid ? () {
              //         final isValidForm = formKey.currentState!.validate();
              //         if (isValidForm) {}
              //       }: null,
              //       child: const Text(
              //         'Continue',
              //         style:
              //             TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              //       ),
              //     ),
              //   ),
              // ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(formValid ? Color(0xFF275342): Color.fromARGB(255, 213, 223, 219)),
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
                      'Continue',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
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
      ),
    );
  }
}
