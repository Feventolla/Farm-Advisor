import 'package:farmadvisor/screens/Dashboard/Bar_chart/barchart_page.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/snow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Field extends StatefulWidget {
  final String? id;
  const Field({Key? key, this.id}) : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  void initState() {
    super.initState();
    _fetchField();
  }

  String _name = '';
  List _sensor = [];
  _fetchField() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var res = await http.get(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/field/${widget.id}"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      setState(() {
        _name = json.decode(res.body)['name'];
        _sensor = json.decode(res.body)['sensors'];
      });
      print(_sensor);
    } else {
      throw Exception(
        "Could not get the farm",
      );
    }
  }

  Future delete(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var res = await http.delete(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/sensor/${id}"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      print("deleted");
      _fetchField();

      //   setState(() {
      //     _name = json.decode(res.body)['name'];
      //     _sensor = json.decode(res.body)['sensors'];
      //   });
      //   print(_sensor);
    } else {
      throw Exception(
        "Could not get the farm",
      );
    }
  }

  Future deleteField(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var res = await http.delete(
      Uri.parse("https://quaint-kerchief-crab.cyclic.app/field/${widget.id}"),
      headers: {
        'Authorization': 'Bearer $token',
        "content-type": "application/json",
      },
    );

    if (res.statusCode == 200) {
      print("deleted");
      // _fetchField();
      context.go('/dashboard');

      //   setState(() {
      //     _name = json.decode(res.body)['name'];
      //     _sensor = json.decode(res.body)['sensors'];
      //   });
      //   print(_sensor);
    } else {
      throw Exception(
        "Could not get the farm",
      );
    }
  }

  bool show_sensor = true;
  List<String> GDD = ["375", "455", "not until now", "375"];

  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 11, 04), end: DateTime(2022, 11, 10));
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
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
                                      children: <Widget>[
                                        ListTile(
                                          title:
                                              Text('Reset GDD on all sensors'),
                                          tileColor: Color.fromARGB(
                                              255, 251, 248, 248),
                                        ),
                                        ListTile(
                                          title: Text('Edit field'),
                                          tileColor: Color.fromARGB(
                                              255, 240, 239, 239),
                                        ),
                                        ListTile(
                                          title: GestureDetector(
                                            onTap: () {
                                              deleteField(widget.id);
                                            },
                                            child: Text('Delete field'),
                                          ),
                                          tileColor: Color.fromARGB(
                                              255, 252, 250, 250),
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
                                onPressed: () {
                                  context.goNamed("field",
                                      params: {"id": widget.id.toString()});
                                }),
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
                          itemCount: _sensor.length,
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
                                                          children: <Widget>[
                                                            ListTile(
                                                              title: Text(
                                                                  'Reset GDD'),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      251,
                                                                      248,
                                                                      248),
                                                            ),
                                                            ListTile(
                                                              title: Text(
                                                                  'Edit sensor'),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      240,
                                                                      239,
                                                                      239),
                                                            ),
                                                            ListTile(
                                                              title:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  delete(_sensor[
                                                                          index]
                                                                      ["_id"]);
                                                                },
                                                                child: Text(
                                                                    'Delete sensor'),
                                                              ),
                                                              tileColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      252,
                                                                      250,
                                                                      250),
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
                                    Text(_sensor[index]["name"],
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal)),
                                    Text("GGD: " + _sensor[index]["GGD"],
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
                width: 320,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      width: 1, color: Color.fromARGB(255, 224, 227, 229)),
                  // bottom: BorderSide(width: 1, color: Color(0xFF5F676C)),
                ))),
            Container(
                // padding: EdgeInsets.all(20),
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Weather forcast   ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                            fontSize: 18),
                      ),
                      Text(
                        "  Stastics",
                        style: TextStyle(
                            color: Color.fromARGB(255, 26, 25, 25),
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Text("Period",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: Color.fromARGB(255, 147, 145, 145)))
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(top: 10, bottom: 20),
                  color: Colors.white,
                  width: 320,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          '${start.year}/${start.month}/${start.day} - ${end.year}/${end.month}/${end.day}'),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color(0xFF5F676C),
                        ),
                        onPressed: datePicker,
                      ),
                    ],
                  ),
                )
              ],
            )),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: const Text(
                      'Temperature',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
            Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Mon",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Tue",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 11",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Wens",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 13",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Thur",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 15",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Fri",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 17",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Sat",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 19 ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromARGB(255, 220, 218, 218),
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: LineChart(
                LineChartData(
                    gridData: FlGridData(getDrawingHorizontalLine: (value) {
                      if (value == 0) {
                        return FlLine(
                          color: Color.fromARGB(255, 216, 216, 221),
                          strokeWidth: 0,
                        );
                      } else {
                        return FlLine(
                          color: Color.fromARGB(255, 208, 208, 212),
                          strokeWidth: 0.8,
                        );
                      }
                    }, getDrawingVerticalLine: (value) {
                      return FlLine(color: Color.fromARGB(0, 255, 255, 255));
                    }),
                    lineTouchData: LineTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(),
                      rightTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                            color: Color.fromARGB(255, 105, 107, 109),
                            fontSize: 12,
                          );
                        },
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return '350';

                            case 2:
                              return '400';
                            case 3:
                              return '450';
                            case 4:
                              return '500';
                            case 5:
                              return '550';
                            case 6:
                              return '600';
                          }
                          return '';
                        },
                        // margin: 12,
                      ),
                      bottomTitles: SideTitles(),
                      leftTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                            color: Color.fromARGB(255, 126, 129, 133),
                            fontSize: 12,
                          );
                        },
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return '0';
                            case 2:
                              return '5';
                            case 3:
                              return '10';
                            case 4:
                              return '15';
                            case 5:
                              return '20';
                            case 6:
                              return '25';
                          }
                          return '';
                        },
                        // margin: 12,
                      ),
                    ),
                    maxX: 6,
                    maxY: 6,
                    minY: 0,
                    minX: 0,
                    lineBarsData: [
                      LineChartBarData(
                          colors: [Colors.red],
                          dotData: FlDotData(show: false),
                          isCurved: true,
                          spots: [
                            const FlSpot(0.2, 2),
                            const FlSpot(0.5, 2.5),
                            const FlSpot(4, 3),
                            const FlSpot(4.5, 3.5),
                            const FlSpot(6, 4),
                            const FlSpot(6.2, 4.5),
                            // const FlSpot(8.4, 5),
                            // const FlSpot(8.6, 5.5),
                            // const FlSpot(8.8, 6),
                            // const FlSpot(10, 6.5),
                            // const FlSpot(10.2, 2)
                          ])
                    ]),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 100),
              child: Row(children: <Widget>[
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromARGB(255, 218, 13, 13),
                ),
                Text(
                  'Measured Temperature',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff979797),
                  ),
                )
              ]),
              color: Colors.white,
            ),
            Container(
                padding: EdgeInsets.only(right: 250, top: 20),
                child: const Text(
                  'Percipitation',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                )),
            Container(
                width: double.infinity,
                height: 300,
                // padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: BarChartPage()
                // color: Colors.black,
                ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 100),
              child: Row(children: <Widget>[
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color(0xFF69A6CE),
                ),
                Text(
                  'Measured Percipitation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff979797),
                  ),
                )
              ]),
              color: Colors.white,
            ),
            Container(
                padding: EdgeInsets.only(right: 250, top: 20),
                child: const Text(
                  'Snow Depth',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                )),
            Container(
                width: 500,
                height: 300,
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: SnowPage()
                // color: Colors.black,
                ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 100),
              child: Row(children: <Widget>[
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color(0xFF085282),
                ),
                Text(
                  'Snow Depth',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff979797),
                  ),
                ),
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color(0xFFEFEDED),
                ),
                Text('Missing Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff979797)))
              ]),
              color: Colors.white,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: const Text(
                      'Wind',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    )),
              ],
            ),
            Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Mon",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Today",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Tue",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 11",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Wens",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 13",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Thur",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 15",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Fri",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 17",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Sat",
                            style: TextStyle(
                              color: Color.fromARGB(255, 50, 51, 52),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "May 19 ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromARGB(255, 220, 218, 218),
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: LineChart(
                LineChartData(
                    gridData: FlGridData(getDrawingHorizontalLine: (value) {
                      if (value == 0) {
                        return FlLine(
                          color: Color.fromARGB(255, 216, 216, 221),
                          strokeWidth: 0,
                        );
                      } else {
                        return FlLine(
                          color: Color.fromARGB(255, 208, 208, 212),
                          strokeWidth: 0.8,
                        );
                      }
                    }, getDrawingVerticalLine: (value) {
                      return FlLine(color: Color.fromARGB(0, 255, 255, 255));
                    }),
                    lineTouchData: LineTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(),
                      rightTitles: SideTitles(),
                      bottomTitles: SideTitles(),
                      leftTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                            color: Color.fromARGB(255, 126, 129, 133),
                            fontSize: 12,
                          );
                        },
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 1:
                              return '0';
                            case 2:
                              return '5';
                            case 3:
                              return '10';
                            case 4:
                              return '15';
                            case 5:
                              return '20';
                            case 6:
                              return '25';
                          }
                          return '';
                        },
                        // margin: 12,
                      ),
                    ),
                    maxX: 6,
                    maxY: 6,
                    minY: 0,
                    minX: 0,
                    lineBarsData: [
                      LineChartBarData(
                          colors: [Colors.black],
                          dotData: FlDotData(show: false),
                          isCurved: true,
                          spots: [
                            const FlSpot(0.2, 2),
                            const FlSpot(0.5, 2.2),
                            const FlSpot(1, 2.5),
                            const FlSpot(1.5, 3),
                            const FlSpot(2, 3.5),
                            const FlSpot(2.5, 4),
                            const FlSpot(4.4, 4.2),
                            const FlSpot(4.8, 4.5),
                            const FlSpot(6, 4.7),
                            const FlSpot(7, 4.8),
                            const FlSpot(7.2, 4.9)
                          ])
                    ]),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 100),
              child: Row(children: <Widget>[
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Color.fromARGB(255, 22, 22, 22),
                ),
                Text(
                  'Measured Temperature',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff979797),
                  ),
                )
              ]),
              color: Colors.white,
            ),
            Container(
                child: SizedBox(
              height: 200,
            ))
          ],
        ),
      ]),
    );
  }

  Future datePicker() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}
