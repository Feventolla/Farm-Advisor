import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SensorHome extends StatefulWidget {
  @override
  State<SensorHome> createState() => _SensorHomeState();
}

class _SensorHomeState extends State<SensorHome> {
  String? _name;
  String? _id;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final id = prefs.getString('fieldId');

    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/field/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      setState(() {
        _name = json.decode(res.body)['name'];
        _id = json.decode(res.body)['id'];
      });
    } else {
      throw Exception(
        "Could not get the farm",
      );
    }
  }

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
                    ),
                    // Container(
                    // padding: EdgeInsets.only(bottom: 20, top: 20),
                    // ),
                  ]))),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black54,
                ),
                Container(
                  // color: Color(0xffEFEFEF),
                  // width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _name ?? "Loading...",
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                      ),
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
                        width: 30,
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
          SizedBox(
            // child: Container(
            //   color: Colors.black,
            // ),
            // width: 30,
            height: 50,
          ),
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('images/mlogo.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Add a Sensor",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 27, 19),
              )),
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
              onPressed: () => {
                    context.goNamed("field", params: {"id": _id.toString()})
                  },
              child: Text("CREATE MY FIRST SENSOR"))
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:go_router/go_router.dart';

// class SensorHome extends StatelessWidget {
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
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             // padding: EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(
//                   Icons.arrow_back,
//                   color: Colors.black54,
//                 ),
//                 Container(
//                   // color: Color(0xffEFEFEF),
//                   // width: 200,
//                   height: 50,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Field Name",
//                         style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         // child: Container(
//                         //   color: Colors.black,
//                         // ),
//                         width: 30,
//                         // height: 50,
//                       ),
//                       Icon(
//                         Icons.more_vert,
//                         color: Colors.black54,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             // child: Container(
//             //   color: Colors.black,
//             // ),
//             // width: 30,
//             height: 50,
//           ),
//           CircleAvatar(
//             radius: 70,
//             backgroundImage: AssetImage('images/mlogo.png'),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text("Add a Sensor",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 9, 27, 19),
//               )),
//           Container(
//             padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
//             child: Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ",
//               textAlign: TextAlign.center,
//             ),
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   minimumSize: Size(351, 48),
//                   primary: Color.fromARGB(255, 44, 93, 75),
//                   elevation: 3),
//               onPressed: () => {context.go('/addsensor')},
//               child: Text("CREATE MY FIRST SENSOR"))
//         ],
//       ),
//     );
//   }
// }
