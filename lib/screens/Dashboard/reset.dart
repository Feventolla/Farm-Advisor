import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Reset extends StatefulWidget {
  const Reset({super.key, required this.title});
  final title;

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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
                    "Agino_logo_green_RGB_300dpi.png",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: 20, left: 260, right: 30, top: 20),
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
              ]))),
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(247, 250, 250, 246),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    // offset: Offset(5, 10),

                    blurStyle: BlurStyle.normal)
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Align(
                      // alignment: Alignment.,
                      child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 41, 41, 41),
                      ),
                      Text(
                        "RESET GDD",
                        style: TextStyle(fontSize: 14, fontFamily: 'Robot'),
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Icon(Icons.more_vert),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.landscape,
                  color: Colors.white,
                ),
                Text("Reset form"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
