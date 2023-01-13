import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF20382F),
          title: Container(
              width: double.infinity,
              height: 100,
              color: Color(0xFF20382F),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20, left: 20, top: 20),
                      child: Image.asset(
                        "Agino_logo_green_RGB_300dpi.png",
                      ),
                    ),
                  ]))),

      // AppBar(
      //   toolbarHeight: 60,
      //   backgroundColor: Color.fromARGB(255, 39, 62, 47),
      //   leading: Container(
      //     padding: EdgeInsets.all(10),
      //     child: Image.asset(
      //       'images/clogo.png',
      //       width: 100,
      //       height: 100,
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(height: 65),
          Center(
              child: Image.asset(
            'images/mlogo.png',
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
          SizedBox(height: 80),
          // RaisedButton(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     color: Color(0xFF275342),
          //     child: Text(
          //       "SIGN UP WITH AGINO",
          //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          //     ),
          //     textColor: Colors.white,
          //     highlightColor: Color.fromARGB(255, 119, 72, 72),
          //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
          //     onPressed: () {}),
          SizedBox(height: 2),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {},
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
