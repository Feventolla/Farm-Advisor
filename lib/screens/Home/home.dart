import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF20382F),
          title: Container(
            width: double.infinity,
            height: 100,
            color: Color(0xFF20382F),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(bottom: 20, left: 20, top: 20),
                child: Image.asset(
                  "assets/Agino_logo_green_RGB_300dpi.png",
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(bottom: 20, left: 260, right: 30, top: 20),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/pingu.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Wellcome to Agino",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(351, 48),
                    primary: Color.fromARGB(255, 44, 93, 75),
                    elevation: 3),
                onPressed: () => {},
                child: Text("CREATE MY FIRST FARM"))
          ],
        ),
        );
  }
}
