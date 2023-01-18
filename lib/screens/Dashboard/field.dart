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
  List<String> Sensors = [
    "45678987654",
    "45678987654",
    "45678987654",
    "45678987654"
  ];
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
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '367',
                          style: TextStyle(
                              fontSize: 34,
                              color: Color(0xFF5F676C),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
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
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '367',
                          style: TextStyle(
                              fontSize: 34,
                              color: Color(0xFF5F676C),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
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
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '367',
                          style: TextStyle(
                              fontSize: 34,
                              color: Color(0xFF5F676C),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
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
            padding: EdgeInsets.only(right: 70, top: 7, bottom: 30),
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
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: 317,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 0.1, color: Color(0xFF5F676C)),

              // bottom: BorderSide(width: 1, color: Color(0xFF5F676C)),
            )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Sensors',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF20382F),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_up),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0),
                itemCount: Sensors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFFFFFFF),
                          // boxShadow: const BoxShadow(),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 219, 218, 218),
                                blurRadius: 5,
                                offset: Offset.zero,
                                blurStyle: BlurStyle.normal)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                // padding: EdgeInsets.only(
                                // bottom: 20, left: 20, top: 20),
                                child: Image.asset(
                                  "Ellipse.png",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.only(left: 70),
                                onPressed: () => {},
                                icon: Icon(Icons.more_vert),
                                color: Color(0xFF5F676C),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 25, top: 10),
                            child: Text(
                              Sensors[index],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF5F676C),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              "GGD 375",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF979797),
                              ),
                            ),
                          )
                        ],
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
