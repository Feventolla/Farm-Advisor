import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:farmadvisor/screens/Dashboard/FarmDashboard.dart';
import 'package:farmadvisor/screens/Onboarding/termspage.dart';
import 'package:farmadvisor/screens/models/farm.dart';
import 'package:farmadvisor/screens/models/user.dart';
import 'package:farmadvisor/screens/Onboarding/widgets/countryselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class FieldHome extends StatefulWidget {
  @override
  State<FieldHome> createState() => _FieldHomeState();
}

class _FieldHomeState extends State<FieldHome> {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  Farm farm = Farm(
    id: '',
    location: '',
    name: '',
  );
  String? _name;
  // List data = ["farm1"];
  // late Farm farm;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final id = storage.getItem('id');
    final token = storage.getItem('token');
    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );
    // print(token + "hey...........");
    print(res.body);

    if (res.statusCode == 200) {
      setState(() {
        _name = json.decode(res.body)['name'];
      });
      // final farm = Farm.fromJson(json.decode(res.body));
      // data.add(farm.name);
      // print(data);
      print(farm.name);

      // farm.name.
      // return farm.map((c) => Farm.fromJson(c)).toList();
      // return farm;
    } else {
      throw Exception("Could not get the farm");
    }
    // body: json.encode({
    //   'name': farm.name,
    //   'location': farm.location,
    // 'email': user.email,
    //   // 'password': user.password
    // })

    // if (res.statusCode != 400 &&
    //     res.statusCode != 404 &&
    //     res.statusCode != 401 &&
    //     res.statusCode != 500) {
    //   context.go("/fieldHome");
    // }
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
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("pingu.jpg"),
                  radius: 30,
                ),
                Container(
                  // color: Color(0xffEFEFEF),
                  // width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _name!,
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
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/pingu.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Add a Field",
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
                    // save()
                    // context.go('/addfield')
                  },
              child: Text("CREATE MY FIRST FIELD"))
        ],
      ),
    );
  }
}
