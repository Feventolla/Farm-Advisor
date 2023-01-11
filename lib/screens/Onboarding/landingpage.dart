import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 39, 62, 47),
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/clogo.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Image.asset(
            'assets/images/mlogo.png',
            width: 203,
            height: 203,
          )
          ),
          Text("Smart Farming", 
          style: TextStyle(
              fontSize: 32,
              
          ),
          )
        ],
      ),
    );
  }
}
