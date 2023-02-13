import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:farmadvisor/screens/models/farm.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FieldHome extends StatefulWidget {
  const FieldHome({super.key});

  @override
  State<FieldHome> createState() => _FieldHomeState();
}

class _FieldHomeState extends State<FieldHome> {
  final LocalStorage storage = LocalStorage('localstorage_app');

  Farm farm = Farm(
    id: '',
    location: '',
    name: '',
  );

  String? _name;
  // String? _location;
  // String? _id;
  // String? _token;
  // late Farm farm;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final id = prefs.getString('farmId');

    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm/$id"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      setState(() {
        _name = json.decode(res.body)['name'];
        // _location = json.decode(res.body)['location'];
        // _id = json.decode(res.body)['id'];
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
                          child: IconButton(
                            onPressed: () {
                              context.go('/profile');
                            },
                            icon: const Icon(
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("pingu.jpg"),
                  radius: 30,
                ),
                SizedBox(
                  // color: Color(0xffEFEFEF),
                  // width: 200,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _name ?? "Loading...",
                        style:
                            const TextStyle(fontFamily: 'Roboto', fontSize: 20),
                      ),
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
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage("assets/pingu.jpg"),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Add a Field",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 9, 27, 19),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(351, 48),
                  primary: const Color.fromARGB(255, 44, 93, 75),
                  elevation: 3),
              onPressed: () => {
                    // save()
                    context.go('/addfield')
                  },
              child: const Text("CREATE MY FIRST FIELD"))
        ],
      ),
    );
  }
}
