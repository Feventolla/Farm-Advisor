import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerificationValidator {
  static validate(value) {
    return value.isEmpty ? 'verification number can not be empty' : null;
  }
}

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final formKey = GlobalKey<FormState>();
  bool formValid = false;

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
            },
          )),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
                child: Text("Verification Code",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 22, 60, 41))),
              ),

              Container(
                key: ValueKey('phonenumber'),
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  validator: (value) => VerificationValidator.validate(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (value != null && value.length < 6) {
                      setState(() {
                        formValid = false;
                      });
                    } else {
                      setState(() {
                        formValid = true;
                      });
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your verification code",
                  ),
                ),
              ),

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
                    onPressed:formValid? () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm){}
                    }: null,
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
