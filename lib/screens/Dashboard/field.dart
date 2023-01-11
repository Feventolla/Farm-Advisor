import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Field extends StatefulWidget {
  const Field({super.key, required this.title});
  final title;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
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
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    // padding: EdgeInsets.only(bottom: 20, top: 20),
                    // ),
                  ]))),
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF7F7F7),
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
                  Container(
                      padding: EdgeInsets.only(right: 70),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF5F676C),
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "Farm name two",
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
              children: const <Widget>[
                Icon(
                  Icons.landscape_outlined,
                  color: Color(0xFF20382F),
                ),
                Text(
                  "127m above sea level",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  // border: Border.all(
                  //     color: const Color(0xFFEFEFEF),
                  //     width: 1.0,
                  //     style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text(
                        '367',
                        style: TextStyle(
                            fontSize: 34,
                            color: Color(0xFF5F676C),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        'Current GDD',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF979797),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      )
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      Text(
                        '367',
                        style: TextStyle(
                            fontSize: 34,
                            color: Color(0xFF5F676C),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        'Current GDD',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF979797),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      )
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      Text(
                        '367',
                        style: TextStyle(
                            fontSize: 34,
                            color: Color(0xFF5F676C),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                      Text(
                        'Current GDD',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF979797),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      )
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
