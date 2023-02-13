// import 'dart:js';
// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future save() async {
      // var res = await http.post(Uri.parse(url),
      //     headers: {'Content-Type': 'application/json'},
      //     body: json.encode({
      //       'firstname': user.firstname,
      //       'lastname': user.lastname,
      //       'email': user.email,
      //       'password': user.password
      //     }));
      // print(res.body);
      // if (res.body != null) {
      context.go('/signin');
      // }
    }

    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Color(0xFF20382F),
      //     title: Container(
      //         width: double.infinity,
      //         height: 100,
      //         color: Color(0xFF20382F),
      //         child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 padding: EdgeInsets.only(bottom: 20, left: 20, top: 20),
      //                 child: Image.asset(
      //                   "images/clogo.png",
      //                 ),
      //               ),
      //             ]))),

      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFF20382F),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/clogo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 205),
          Center(
              child: Image.asset(
            'assets/images/mlogo.png',
            width: 203,
            height: 203,
          )),
          SizedBox(height: 25),
          Text(
            "Smart Farming",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 9, 27, 19),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 320,
            child: Text(
              "Lorem Ipsum is what we Stand for Lorem Ipsum is what we Stand for Lorem Ipsum is what we Stand for",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
          ),
          SizedBox(height: 60),
          ElevatedButton(
              key: Key('sign up'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 2, 74, 16),
                  ),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(color: Colors.white)),
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(255, 90, 33, 9),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 100))),

              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              // color: Color(0xFF275342),
              child: Text(
                "SIGN UP WITH AGINO",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              // textColor: Colors.white,
              // highlightColor: Color.fromARGB(255, 119, 72, 72),
              // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              onPressed: () {
                context.go('/terms');
                // save();
              }),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Color.fromARGB(255, 45, 81, 111),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
