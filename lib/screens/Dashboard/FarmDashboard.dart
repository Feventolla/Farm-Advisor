import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FarmDashboard extends StatefulWidget {
  FarmDashboard({Key? key}) : super(key: key);

  @override
  State<FarmDashboard> createState() => _FarmDashboardState();
}

class _FarmDashboardState extends State<FarmDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
              width: double.infinity,
              height: 80,
              color: Color(0xFF20382F),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Image.asset(
                    "Agino_logo_green_RGB_300dpi.png",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 260, right: 30, top: 20),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ]))),
      body: SingleChildScrollView(
          // width: double.infinity,
          // height: double.infinity,
          // color: Colors.white,

          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: Color(0xFF20382F),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Image.asset(
                    "Agino_logo_green_RGB_300dpi.png",
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 260, right: 30, top: 20),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("pingu.jpg"),
                  radius: 30,
                ),
                Container(
                  color: Color(0xffEFEFEF),
                  width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Farm Name"),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 75, 74, 74),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        // child: Container(
                        //   color: Colors.black,
                        // ),
                        width: 80,
                        // height: 50,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text("Alert"),
            ],
          )),
          Container(
            height: 170,
            width: 420,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      // width: 430,
                      height: 70,

                      // padding: new EdgeInsets.all(10.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          // elevation: 10,
                          child: ListTile(
                            leading: Icon(
                              Icons.warning,
                              color: Colors.red[300],
                            ),
                            title: Text("courses.elementAt(index).title",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            subtitle: Text(
                                "courses.elementAt(index).description",
                                style: TextStyle(
                                    fontSize: 8.0,
                                    color: Color.fromARGB(255, 119, 117, 117))),
                          )));
                }),
          ),
          Container(
              child: Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text("Fields"),
              Container(
                padding: EdgeInsets.only(left: 300),
                child: Icon(Icons.add),
              ),
            ],
          )),
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
          )
        ],
      )),
    );
  }
}
