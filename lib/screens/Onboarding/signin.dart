import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhoneNumberValidator {
  static validate(value) {
    return value.isEmpty ? 'phone number can not be empty' : null;
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
              CountrySelector(),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (value != null && value.length < 8) {
                      setState(() {
                        formValid = false;
                      });
                      // return "Enter a valid number";
                    } else {
                      setState(() {
                        formValid = true;
                      });
                      // return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Enter your phone number",
                  ),
                  validator: (value) => PhoneNumberValidator.validate(value),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: formValid
                        ? Color(0xFF275342)
                        : Color.fromARGB(255, 213, 223, 219),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    highlightColor: Color.fromARGB(255, 119, 72, 72),
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 140),
                    onPressed: formValid
                        ? () {
                            final isValidForm =
                                formKey.currentState!.validate();
                            if (isValidForm) {}
                          }
                        : null,
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
