import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key, required this.title});
  // ignore: prefer_typing_uninitialized_variables
  final title;

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;
  bool isVisible7 = false;
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Padding(
                padding: EdgeInsets.only(left: 0),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: const <Widget>[
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
                isVisible1 = !isVisible1;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
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
            visible: isVisible1,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible2 = !isVisible2;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 2",
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
            visible: isVisible2,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible3 = !isVisible3;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 3",
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
            visible: isVisible3,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible4 = !isVisible4;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 4",
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
            visible: isVisible4,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible5 = !isVisible5;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 5",
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
            visible: isVisible5,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible6 = !isVisible6;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 6",
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
            visible: isVisible6,
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
                    child: const Align(
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
          GestureDetector(
            onTap: () {
              setState(() {
                click = !click;
                isVisible7 = !isVisible7;
              });
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                    child: Container(
                  height: 40,
                  width: double.infinity,
                  color: const Color(0xFFF5F6F9),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                            right: 10), //apply padding to all four sides
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Question 7",
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
            visible: isVisible7,
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
                    child: const Align(
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
        ],
      ),
    );
  }
}
