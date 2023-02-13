import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Reset extends StatefulWidget {
  const Reset({super.key, required this.title});
  // ignore: prefer_typing_uninitialized_variables
  final title;

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF20382F),
          title: Container(
              width: double.infinity,
              height: 100,
              color: const Color(0xFF20382F),
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20, left: 20, top: 20),
                  child: Image.asset(
                    "Agino_logo_green_RGB_300dpi.png",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 260, right: 30, top: 20),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ]))),
      body: ListView(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(247, 250, 250, 246),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    // offset: Offset(5, 10),

                    blurStyle: BlurStyle.normal)
              ],
            ),
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                      // alignment: Alignment.,
                      child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.keyboard_arrow_left_outlined,
                      ),
                      Text(
                        "RESET GDD",
                        style: TextStyle(fontSize: 10.5, fontFamily: 'Robot'),
                      ),
                    ],
                  )),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Icon(
                      Icons.more_vert,
                    ),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            child: Row(
              children: const <Widget>[
                Text(
                  "Reset from",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Card(
                child: Container(
                    height: 40,
                    width: double.infinity,
                    color: const Color(0xFFF5F6F9),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10), //apply padding to all four sides
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "11 May 2022",
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    click = !click;
                                  });
                                },
                                child: const Icon(
                                  Icons.calendar_today,
                                ),
                              )
                            ],
                          )),
                    )),
              )),
          Visibility(
            visible: click,
            child: Expanded(
              flex: 1,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Card(
                      child: Container(
                    height: 100,
                    width: double.infinity,
                    color: const Color(0xFFF5F6F9),
                    child: SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(2022, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {
                          // Do something
                        },
                      ),
                    ),
                  ))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10), //apply padding to all four sides
                    child: Text(
                      style: TextStyle(fontSize: 10),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel fermentum mauris. Proin id erat feugiat, fermentum mi at, aliquet",
                    ),
                  ),
                )),
          ),
          const Divider(
            color: Color.fromRGBO(211, 211, 211, 1),
            height: 25,
            thickness: 0.7,
            indent: 15,
            endIndent: 15,
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 15), //apply padding to all four sides
            child: Text(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              "Previous reset days",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 15), //apply padding to all four sides
            child: Text(
              style: TextStyle(fontSize: 10),
              "22 November 2021",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 15), //apply padding to all four sides
            child: Text(
              style: TextStyle(fontSize: 10),
              "10 July 2021",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 15), //apply padding to all four sides
            child: Text(
              style: TextStyle(fontSize: 10),
              "22 May 2021",
            ),
          ),
          const Spacer(),
          const SizedBox(
            height: 330,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 25, left: 25, top: 10, bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 41, 76, 63),
                  ),
                  onPressed: () {},
                  child: const Text('RESET GDD'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
