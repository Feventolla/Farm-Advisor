import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Help extends StatefulWidget {
  const Help({super.key, required this.title});
  final title;

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool isVisible = false;
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Color(0xFF20382F),
      //     title: Container(
      //         width: double.infinity,
      //         height: 100,
      //         color: Color(0xFF20382F),
      //         child: Row(children: [

      //           Container(
      //             padding: EdgeInsets.only(bottom: 20, top: 20),
      //             child: Icon(
      //               Icons.person,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ]))),
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(247, 250, 250, 246),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    // offset: Offset(5, 10),

                    blurStyle: BlurStyle.normal)
              ],
            ),
            child: Row(children: <Widget>[
              Align(
                  child: Row(
                children: const <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 41, 41, 41),
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "HELP",
                    style: TextStyle(fontSize: 11, fontFamily: 'Robot'),
                  ),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(left: 0),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.landscape,
                  color: Colors.white,
                ),
                Text(
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    "FAQ"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible = !isVisible;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Question 1",
                              ),
                              Icon(
                                (click = false)
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                              ),
                            ]),
                      )),
                ))),
          ),
          Visibility(
            visible: isVisible,
            child: Expanded(
              flex: 1,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Card(
                      child: Container(
                    height: 100,
                    width: double.infinity,
                    color: Color(0xFFF5F6F9),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10), //apply padding to all four sides
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel fermentum mauris. Proin id erat feugiat, fermentum mi at, aliquet neque. Cras dapibus quam rhoncus, volutpat elit non, sodales leo. Vivamus id bibendum sapien, ac egestas neque. Nunc varius sapien arcu, sit amet imperdiet lorem convallis non.",
                          ),
                        )),
                  ))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 2",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 3",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 4",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 5",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 6",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                  child: Container(
                height: 40,
                width: double.infinity,
                color: Color(0xFFF5F6F9),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10), //apply padding to all four sides
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Question 7",
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ]),
                    )),
              ))),
        ],
      ),
    );
  }
}
