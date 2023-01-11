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
      body: Column(
        children: [
          Center(
              child: Image.asset(
            'mlogo.png',
            width: 203,
            height: 203,
          )),
          Text(
            "Smart Farming",
            style: TextStyle(
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
