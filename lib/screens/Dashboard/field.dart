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
  bool show_sensor = true;
  List<String> GDD = ["375", "455", "not until now", "375"];
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
      body: ListView(children: [
        Column(
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
                              style:
                                  TextStyle(fontSize: 14, fontFamily: 'Robot'),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SingleChildScrollView(
                                  child: Container(
                                    width: 300,
                                    height: 200,
                                    child: ListView(
                                      children: const <Widget>[
                                        ListTile(
                                          title:
                                              Text('Reset GDD on all sensors'),
                                          tileColor: Color.fromARGB(
                                              255, 246, 242, 242),
                                        ),
                                        ListTile(
                                          title: Text('Edit sensor'),
                                          tileColor: Color.fromARGB(
                                              255, 244, 238, 238),
                                        ),
                                        ListTile(
                                          title: Text('Delete sensor'),
                                          tileColor: Color.fromARGB(
                                              255, 246, 242, 242),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
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
                width: 330,
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
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
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
                  ),
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
              width: 320,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                    width: 1, color: Color.fromARGB(255, 224, 227, 229)),
                // bottom: BorderSide(width: 1, color: Color(0xFF5F676C)),
              )),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Sensors',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.normal),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Color(0xFF5F676C),
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: (show_sensor
                                  ? Icon(
                                      Icons.keyboard_arrow_up,
                                      color: Color(0xFF5F676C),
                                    )
                                  : Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color(0xFF5F676C),
                                    )),
                              onPressed: () {
                                setState(() {
                                  show_sensor = !show_sensor;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // for (var item in GDD)
                  Visibility(
                    visible: show_sensor,
                    child: Container(
                        width: 430,
                        height: 370,
                        // padding: EdgeInsets.all(12.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: GDD.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 20.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 220, 218, 218),
                                      width: 0.5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    // for (var item in GDD)
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Image.asset(
                                            "images/mlogo.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: Color(0xFF5F676C),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Container(
                                                        width: 300,
                                                        height: 200,
                                                        child: ListView(
                                                          children: const <
                                                              Widget>[
                                                            ListTile(
                                                              title: Text(
                                                                  'Reset GDD'),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      246,
                                                                      242,
                                                                      242),
                                                            ),
                                                            ListTile(
                                                              title: Text(
                                                                  'Edit sensor'),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      244,
                                                                      238,
                                                                      238),
                                                            ),
                                                            ListTile(
                                                              title: Text(
                                                                  'Delete sensor'),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      246,
                                                                      242,
                                                                      242),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("4567982900",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal)),
                                    Text("GDD 375",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 10,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromARGB(
                                                255, 147, 145, 145))),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.black,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.white,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.black,
            )
          ],
        ),
      ]),
    );
  }
}
