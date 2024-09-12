import 'package:covid_19_api_project/Model/WordCovidAPI.dart';
import 'package:covid_19_api_project/Sarvices/State_sarvice.dart';
import 'package:covid_19_api_project/Screen/Countriespagelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  StateSarvice stateSarvice = StateSarvice(); // API coll kora hoice.

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorslist = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa268),
    Color(0xffda5264),
    Color(0xffda8888),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // design
          child: Padding(
            // design
            padding: EdgeInsets.all(35.r), // design
            child: Column(
              // design
              children: [
                // design
                SizedBox(
                  // design
                  height: MediaQuery.of(context).size.height * .01, // design
                ),
                FutureBuilder<WorldCovidAPI>(
                    future: stateSarvice.Covid19api(),
                    builder: (context, AsyncSnapshot<WorldCovidAPI> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.black,
                            size: 50,
                            controller: _controller,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            PieChart(
                              // design
                              dataMap: {
                                // design
                                'Total ': double.parse(
                                    snapshot.data!.cases!.toString()), // design
                                'recovered ': double.parse(snapshot
                                    .data!.recovered
                                    .toString()), // design
                                'deaths ': double.parse(
                                    snapshot.data!.deaths.toString()),
                                'tests': double.parse(
                                    snapshot.data!.tests.toString()), // design
                              },
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              chartRadius: MediaQuery.of(context).size.width /
                                  3.2, // design
                              legendOptions: // design
                                  LegendOptions(
                                      legendPosition:
                                          LegendPosition.left), // design
                              animationDuration:
                                  Duration(milliseconds: 1200), // design
                              chartType: ChartType.ring, // design
                              colorList: colorslist, // design
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  // design
                                  vertical: MediaQuery.of(context).size.height *
                                      .06), // design
                              child: Card(
                                // design
                                child: Column(
                                  // design
                                  children: [
                                    // design
                                    ColumnRow(
                                        title: 'Total',
                                        value: snapshot.data!.cases
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'recovered',
                                        value: snapshot.data!.recovered
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'updated',
                                        value: snapshot.data!.updated
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'deaths',
                                        value: snapshot.data!.deaths
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'todayDeaths',
                                        value: snapshot.data!.todayDeaths
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'tests',
                                        value: snapshot.data!.tests
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'oneCasePerPeople',
                                        value: snapshot.data!.oneCasePerPeople
                                            .toString()), // design
                                    ColumnRow(
                                        title: 'critical',
                                        value: snapshot.data!.critical
                                            .toString()), // design
                                  ],
                                ),
                              ),
                            ),
                            // design
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Countriespagelist()));
                              },
                              child: Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Color(0xff1aa268),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Track Countires',
                                      style: TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// design
class ColumnRow extends StatelessWidget {
  String title, value;
  ColumnRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(),
        ],
      ),
    );
  }
}
