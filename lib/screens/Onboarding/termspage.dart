import 'package:farmadvisor/screens/Onboarding/widgets/termtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TERMS & CONDITIONS",
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
        // do something
      },),
    ),
    body: 
          
          Column(
            
           
          ),
        );
  }
}
