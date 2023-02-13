import 'dart:convert';

import 'package:farmadvisor/screens/models/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FarmDashboard extends StatefulWidget {
  const FarmDashboard({Key? key}) : super(key: key);

  @override
  State<FarmDashboard> createState() => _FarmDashboardState();
}

class _FarmDashboardState extends State<FarmDashboard> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  String _name = '';
  List _fields = [];
  _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final id = prefs.getString('farmId');

// prefs.remove("fieldId")

    print(token);

    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    print(res.body);

    if (res.statusCode == 200) {
      setState(() {
        _name = json.decode(res.body)['name'];
        _fields = json.decode(res.body)['fields'];
      });
      print(_fields);
    } else {
      throw Exception(
        "Could not get the farm",
      );
    }
  }

  List<String> list = ["farmone", "farmtwo", "farmthree", "farmfour"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF20382F),
          title: Container(
              width: double.infinity,
              height: 100,
              color: const Color(0xFF20382F),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 20, left: 20, top: 20),
                      child: Image.asset(
                        "Agino_logo_green_RGB_300dpi.png",
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: IconButton(
                            onPressed: () {
                              context.go('/profile');
                            },
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Container(
                    // padding: EdgeInsets.only(bottom: 20, top: 20),
                    // ),
                  ]))),
      body: ListView(
          // width: double.infinity,
          // height: double.infinity,
          // color: Colors.white,

          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("pingu.jpg"),
                        radius: 30,
                      ),
                      Container(
                        color: const Color(0xffEFEFEF),
                        // width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _name,
                              style:
                                  TextStyle(fontFamily: 'Roboto', fontSize: 20),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color.fromARGB(255, 75, 74, 74),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            // child: Container(
                            //   color: Colors.black,
                            // ),
                            width: 30,
                            // height: 50,
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                        ],
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
                    Text("Alert",
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 17)),
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
                                          color: Color.fromARGB(
                                              255, 119, 117, 117))),
                                )));
                      }),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Fields",
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 17)),
                    Container(
                        // padding: EdgeInsets.only(left: 300),
                        child: IconButton(
                      onPressed: () {
                        context.go('/addfield');
                      },
                      icon: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 75, 74, 74),
                      ),
                    )),
                  ],
                )),

                Column(
                  children: [
                    for (var item in _fields)
                      GestureDetector(
                        onTap: () {
                          // GoRouter(routes: )
                        },
                        child: Container(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color.fromARGB(255, 220, 218, 218),
                                      width: 0.5,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(15)),
                              width: 420,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              // color: Colors.white,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: AssetImage("pingu.jpg"),
                                      radius: 20,
                                    ),
                                    title: Text(item["name"],
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
                                    subtitle: Text(item["attitude"],
                                        style: const TextStyle(
                                            fontSize: 12.0,
                                            color: Color.fromARGB(
                                                255, 119, 117, 117))),
                                    trailing: IconButton(
                                      onPressed: () {
                                        // context.go('/sensor/${item["_id"]}');
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => Field(
                                        //             title: "",
                                        //             id: item["_id"])));
                                        // Navigator.pushNamed(context, '/sensor',
                                        //     arguments: 42);
                                        context.goNamed("fields",
                                            params: {"id": item["_id"]});
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color.fromARGB(255, 75, 74, 74),
                                      ),
                                    ),
                                  ),

                                  // Text("Relax its all good")
                                ],
                              )),
                        ),
                      )
                  ],
                ),
                const SizedBox(
                  height: 200,
                )
                // Container(
                //     height: 500,
                //     width: 420,
                //     child: Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(5.0),
                //         ),
                //         color: Colors.white,
                //         child: Column(
                //           children: [
                //             Column(
                //               children: [
                //                 for (var item in list)
                //                   ListTile(
                //                     leading: CircleAvatar(
                //                       backgroundImage: AssetImage("pingu.jpg"),
                //                       radius: 40,
                //                     ),
                //                     title: Text(item,
                //                         style: TextStyle(
                //                             fontSize: 13.0,
                //                             color: Color.fromARGB(255, 0, 0, 0))),
                //                     subtitle: Text(
                //                         "courses.elementAt(index).description",
                //                         style: TextStyle(
                //                             fontSize: 8.0,
                //                             color:
                //                                 Color.fromARGB(255, 119, 117, 117))),
                //                     trailing: Icon(Icons.keyboard_arrow_right),
                //                   )
                //               ],
                //             )
                //           ],
                //         )))
              ],
            )
          ]),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';

// class FarmDashboard extends StatefulWidget {
//   FarmDashboard({Key? key}) : super(key: key);

//   @override
//   State<FarmDashboard> createState() => _FarmDashboardState();
// }

// class _FarmDashboardState extends State<FarmDashboard> {
//   List<String> list = ["farmone", "farmtwo", "farmthree", "farmfour"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color(0xFF20382F),
//           title: Container(
//               width: double.infinity,
//               height: 100,
//               color: Color(0xFF20382F),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(bottom: 20, left: 20, top: 20),
//                       child: Image.asset(
//                         "Agino_logo_green_RGB_300dpi.png",
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20),
//                             child: IconButton(
//                               onPressed: () {
//                                 context.go('/profile');
//                               },
//                               icon: Icon(
//                                 Icons.person,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Container(
//                     // padding: EdgeInsets.only(bottom: 20, top: 20),
//                     // ),
//                   ]))),
//       body: ListView(
//           // width: double.infinity,
//           // height: double.infinity,
//           // color: Colors.white,

//           children: [
//             Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(40),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage("pingu.jpg"),
//                         radius: 30,
//                       ),
//                       Container(
//                         color: Color(0xffEFEFEF),
//                         // width: 200,
//                         height: 50,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "Farm Name",
//                               style:
//                                   TextStyle(fontFamily: 'Roboto', fontSize: 20),
//                             ),
//                             Icon(
//                               Icons.keyboard_arrow_down,
//                               color: Color.fromARGB(255, 75, 74, 74),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               // child: Container(
//                               //   color: Colors.black,
//                               // ),
//                               width: 30,
//                               // height: 50,
//                             ),
//                             Icon(
//                               Icons.more_vert,
//                               color: Colors.black54,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                     child: Row(
//                   children: [
//                     SizedBox(
//                       width: 50,
//                     ),
//                     Text("Alert",
//                         style: TextStyle(fontFamily: 'Roboto', fontSize: 17)),
//                   ],
//                 )),
//                 Container(
//                   height: 170,
//                   width: 420,
//                   child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: 2,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                             // width: 430,
//                             height: 70,

//                             // padding: new EdgeInsets.all(10.0),
//                             child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                                 color: Colors.white,
//                                 // elevation: 10,
//                                 child: ListTile(
//                                   leading: Icon(
//                                     Icons.warning,
//                                     color: Colors.red[300],
//                                   ),
//                                   title: Text("courses.elementAt(index).title",
//                                       style: TextStyle(
//                                           fontSize: 13.0,
//                                           color: Color.fromARGB(255, 0, 0, 0))),
//                                   subtitle: Text(
//                                       "courses.elementAt(index).description",
//                                       style: TextStyle(
//                                           fontSize: 8.0,
//                                           color: Color.fromARGB(
//                                               255, 119, 117, 117))),
//                                 )));
//                       }),
//                 ),
//                 Container(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text("Fields",
//                         style: TextStyle(fontFamily: 'Roboto', fontSize: 17)),
//                     Container(
//                       // padding: EdgeInsets.only(left: 300),
//                       child: Icon(Icons.add),
//                     ),
//                   ],
//                 )),

//                 Column(
//                   children: [
//                     for (var item in list)
//                       GestureDetector(
//                         onTap: () {
//                           // GoRouter(routes: )
//                         },
//                         child: Container(
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border: Border.all(
//                                       color: Color.fromARGB(255, 220, 218, 218),
//                                       width: 0.5,
//                                       style: BorderStyle.solid),
//                                   borderRadius: BorderRadius.circular(15)),
//                               width: 420,
//                               padding: EdgeInsets.all(20),
//                               margin: EdgeInsets.all(5),
//                               // color: Colors.white,
//                               child: Column(
//                                 // mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ListTile(
//                                     leading: CircleAvatar(
//                                       backgroundImage: AssetImage("pingu.jpg"),
//                                       radius: 40,
//                                     ),
//                                     title: Text(item,
//                                         style: TextStyle(
//                                             fontSize: 13.0,
//                                             color:
//                                                 Color.fromARGB(255, 0, 0, 0))),
//                                     subtitle: Text("some description here",
//                                         style: TextStyle(
//                                             fontSize: 8.0,
//                                             color: Color.fromARGB(
//                                                 255, 119, 117, 117))),
//                                     trailing: Icon(Icons.keyboard_arrow_right),
//                                   ),
//                                   Text("Relax its all good")
//                                 ],
//                               )),
//                         ),
//                       )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 200,
//                 )
//                 // Container(
//                 //     height: 500,
//                 //     width: 420,
//                 //     child: Card(
//                 //         shape: RoundedRectangleBorder(
//                 //           borderRadius: BorderRadius.circular(5.0),
//                 //         ),
//                 //         color: Colors.white,
//                 //         child: Column(
//                 //           children: [
//                 //             Column(
//                 //               children: [
//                 //                 for (var item in list)
//                 //                   ListTile(
//                 //                     leading: CircleAvatar(
//                 //                       backgroundImage: AssetImage("pingu.jpg"),
//                 //                       radius: 40,
//                 //                     ),
//                 //                     title: Text(item,
//                 //                         style: TextStyle(
//                 //                             fontSize: 13.0,
//                 //                             color: Color.fromARGB(255, 0, 0, 0))),
//                 //                     subtitle: Text(
//                 //                         "courses.elementAt(index).description",
//                 //                         style: TextStyle(
//                 //                             fontSize: 8.0,
//                 //                             color:
//                 //                                 Color.fromARGB(255, 119, 117, 117))),
//                 //                     trailing: Icon(Icons.keyboard_arrow_right),
//                 //                   )
//                 //               ],
//                 //             )
//                 //           ],
//                 //         )))
//               ],
//             )
//           ]),
//     );
//   }
// }
