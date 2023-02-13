import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';


class PhoneValidator {
  static validate(value) {
    return value.isEmpty ? 'phone can not be empty' : null;
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 0;
    if (token != 0) {
      context.go('/home');
    }
  }

  final LocalStorage storage = new LocalStorage('localstorage_app');
  User user = User(country: '', phone: '', token: '');

  Future save() async {
    var res = await http.post(
        Uri.parse("https://quaint-kerchief-crab.cyclic.app/user/login"),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*"
        },
        body: json.encode({
          // 'country': user.country,
          'phone': user.phone,
          // 'email': user.email,
          // 'password': user.password
        }));
    // final token = User.fromJson(json.decode(res.body)).token;
    // storage.setItem('token', token);
    // print(storage.getItem('token'));

    // // User.fromJson(json.decode(res.body)).token;
    // print(res.body);
    if (res.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', User.fromJson(json.decode(res.body)).token);

      context.go("/home");
      // Navigator.pushNamed(context, '/home');
    }
    if (res.statusCode != 400 && res.statusCode != 404) {
    } else {
      throw Exception('Failed auth');
    }
  }

  final formKey = GlobalKey<FormState>();
  bool formValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "BACK",
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

              context.go('/');

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
                  child: Text("Login with your phone number",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 22, 60, 41))),
                ),
              ),
              // SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(

                  //key: ValueKey('phoneNo'),
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: ValueKey('phone'),

                  controller: TextEditingController(text: user.phone),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,

                  onChanged: (value) {
                    user.phone = value;
                  },
                  // onChanged: (value) {
                  //   if (value != null && value.length < 6) {
                  //     setState(() {
                  //       formValid = false;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       formValid = true;
                  //     });
                  //   }
                  // },
                  validator: (value) => PhoneValidator.validate(value),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your phone number",
                  ),
                ),
              ),

              //  Expanded(
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
              //       onPressed:formValid? () {
              //         final isValidForm = formKey.currentState!.validate();
              //         if (isValidForm){}
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        save();
                      }
                    },
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 119, 72, 72),
                      onPrimary: Colors.white,
                      minimumSize: Size(140, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

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
                    //   'Continue',
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
