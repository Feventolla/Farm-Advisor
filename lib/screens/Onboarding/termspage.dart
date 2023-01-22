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
            
            children: [
              Expanded(
                child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TermsText(),
              ),
              ),
              SizedBox(height: 20),
             RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFF275342),
              child: Text(
                "AGREE TO TERMS AND CONDITIONS",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              textColor: Colors.white,
              highlightColor: Color.fromARGB(255, 119, 72, 72),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
              onPressed: () {}),

              SizedBox(height: 10) 
        ]
          ),
        );
  }
}
