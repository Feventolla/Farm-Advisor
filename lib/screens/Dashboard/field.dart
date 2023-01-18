import 'package:farmadvisor/screens/Dashboard/Bar_chart/barchart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fl_chart/fl_chart.dart';

class Field extends StatefulWidget {
  const Field({super.key, required this.title});
  final title;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool show_sensor = true;
  List<String> GDD = ["375", "455", "not until now", "375"];
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
                                      children: const <Widget>[
                                        ListTile(
                                          title:
                                              Text('Reset GDD on all sensors'),
                                          tileColor: Color.fromARGB(
                                              255, 251, 248, 248),
                                        ),
                                        ListTile(
                                          title: Text('Edit sensor'),
                                          tileColor: Color.fromARGB(
                                              255, 240, 239, 239),
                                        ),
                                        ListTile(
                                          title: Text('Delete sensor'),
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
                              onPressed: () {},
                            ),
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
                          itemCount: GDD.length,
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
                                                          children: const <
                                                              Widget>[
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
                                                              title: Text(
                                                                  'Delete sensor'),
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
                                    Text("4567982900",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17,
                                            fontStyle: FontStyle.normal)),
                                    Text("GDD 375",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "data",
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
                    gridData: FlGridData(
                      show: false,
                    ),
                    lineTouchData: LineTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(
                          // showTitles: true,
                          // reservedSize: 35,
                          // getTextStyles: (context, value) {
                          //   return const TextStyle(
                          //       color: Color.fromARGB(255, 44, 45, 46),
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold);
                          // },
                          // getTitles: (value) {
                          //   switch (value.toInt()) {
                          //     case 0:
                          //       return 'Mon';
                          //     case 0:
                          //       return 'Tue';
                          //     case 5:

//       return 'Wes';
                          //     case 7:
                          //       return 'Thur';
                          //     case 9:
                          //       return 'Fri';
                          //     case 11:
                          //       return 'Sat';
                          //     case 13:
                          //       return 'Sun';
                          //     case 15:
                          //       return 'Mon';
                          //   }
                          //   return '';
                          // },
                          // margin: 8
                          ),
                      rightTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTextStyles: (context, value) {
                          return const TextStyle(
                              color: Color.fromARGB(255, 105, 107, 109),
                              fontSize: 12,
                              fontWeight: FontWeight.bold);
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
                              fontWeight: FontWeight.bold);
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
                // padding: const EdgeInsets.all(8),
                child: BarChartPage()
                // color: Colors.black,
                ),
            Container(
              width: 300,
              height: 300,
              color: Colors.white,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.black,
            )
          ],
        ),
      ]),
    );
  }
}

Future datePicker() async {
  // showDateRangePicker(context: context, firstDate: firstDate, lastDate: lastDate)
}
