import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final id = prefs.getString('farmId');

    print(token);

    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/farm"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      var name = json.decode(res.body)['name'] ?? 0;
      print(name);
      if (name != 0) {
        prefs.setString('farmId', json.decode(res.body)['id']);
        // ignore: use_build_context_synchronously
        context.go('/dashboard');
      }
      // print("namee" + name);
      // setState(() {
      //   _name = json.decode(res.body)['name'];
      //   _fields = json.decode(res.body)['attributes'];
      // });

      // prefs.setString('farmId', json.decode(res.body)['id']);
      // context.go('/dashboard');
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
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, top: 20),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/pingu.jpg"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Wellcome to Agino",
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
                key: Key('addfarm'),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(351, 48),
                    primary: const Color.fromARGB(255, 44, 93, 75),
                    elevation: 3),
                onPressed: () => {context.go('/addfarm')},
                child: const Text("CREATE MY FIRST FARM"))
          ],
        ));
  }
}
