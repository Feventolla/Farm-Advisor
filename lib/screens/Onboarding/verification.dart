import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        // do something
      },)
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
                  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Verification Code",textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 22, 60, 41))),
                ),
              
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? "Enter a valid number"
                      : null,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your verification code",
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: Color(0xFF275342),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    highlightColor: Color.fromARGB(255, 119, 72, 72),
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                    onPressed: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm){}
                    },
                    child: const Text(
                      'Continue',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
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
