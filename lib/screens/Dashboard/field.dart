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
                      padding: EdgeInsets.only(right: 100),
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
                    padding: EdgeInsets.only(left: 50),
                    child: Icon(Icons.more_vert),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15.0, bottom: 15),
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
                    fontSize: 16,
                    color: Color(0xFF20382F),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 100,
              width: 300,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
<<<<<<< HEAD
                color: Color(0xFFFFFFFF),
                border: Border.all(
                    color: const Color(0xFFEFEFEF),
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // padding: EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
=======
                  color: Color(0xFFFFFFFF),
                  // border: Border.all(
                  //     color: const Color(0xFFEFEFEF),
                  //     width: 1.0,
                  //     style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
>>>>>>> 5b800e15c69e2e54336ae748744b20c9e9888079
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
          Container(
            padding: EdgeInsets.only(right: 70, top: 7, bottom: 7),
            child: Text(
              'Last sensor reset: 04/03/22 (auto reset)',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF979797),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 1, color: Color(0xFF5F676C)),
              bottom: BorderSide(width: 1, color: Color(0xFF5F676C)),
            )),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[Text('Sensors')],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
