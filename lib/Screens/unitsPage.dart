import 'package:epcc/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';

class UnitsPage extends StatefulWidget {
  const UnitsPage({Key? key}) : super(key: key);

  @override
  _UnitsPageState createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  late List<String> _list;
  String _selectedItem = '';

  final List<ChartData> chartData = [
    ChartData('Jan-1', 30),
    ChartData('Jan-3', 90),
    ChartData('Jan-5', 50),
  ];

  final List<ChartData> chartData2 = [
    ChartData('Jan-1', 35),
    ChartData('Jan-3', 72),
    ChartData('Jan-5', 62),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: epccBlue500,
            elevation: 4,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 22,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/ifl_logo_small.png"))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "EPCC",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/profile.jpg"))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Transform.rotate(
                transformHitTests: true,
                angle: 3.15,
                child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.sort,
                      size: 25,
                    )),
              )
            ]),
        body: Column(children: [
          Expanded(
              flex: 1,
              child: Container(
                color: epccBlue500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 25,
                      child: Icon(Icons.arrow_back, color: white),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 26,
                            height: 25,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Units",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Divider(
                      indent: MediaQuery.of(context).size.width * 0.3,
                      endIndent: MediaQuery.of(context).size.width * 0.3,
                      color: white,
                    ),
                    SizedBox(
                      height: 3,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.red,
                              dropDownOverlayBGColor: Colors.red,
                              padding: 10,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.red,
                              dropDownList: [
                                "2020",
                                "2019",
                                "2018",
                                "2017",
                                "2016",
                                "2015",
                                "2014",
                                "2013"
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.yellow,
                              dropDownOverlayBGColor: Colors.yellow,
                              padding: 10,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.yellow,
                              dropDownList: [
                                "Jan",
                                "Feb",
                                "Mar",
                                "April",
                                "May",
                                "june",
                                "July"
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.green,
                              dropDownOverlayBGColor: Colors.green,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.green,
                              dropDownList: [
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                "6",
                                "7",
                                "8",
                                "9",
                                "10"
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: SfCartesianChart(
                                    primaryYAxis: CategoryAxis(
                                      title: AxisTitle(
                                          text: 'Consumption (KHW)',
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    primaryXAxis: CategoryAxis(
                                      title: AxisTitle(
                                          text: 'Days',
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    series: <ColumnSeries>[
                                      ColumnSeries<ChartData, String>(
                                          dataLabelSettings: DataLabelSettings(
                                              color: Colors.white,
                                              labelAlignment:
                                                  ChartDataLabelAlignment.auto,
                                              isVisible: true),
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y),
                                      ColumnSeries<ChartData, String>(
                                          // Hiding the legend item for this series
                                          dataLabelSettings: DataLabelSettings(
                                              color: Colors.white,
                                              labelAlignment:
                                                  ChartDataLabelAlignment.auto,
                                              isVisible: true),
                                          dataSource: chartData2,
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y)
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                getTiles(epccBlue, "Unit 1"),
                getTiles(Colors.green, "Unit 2")
              ],
            ),
          ),
        ]));
  }

  getTiles(Color color, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        width: double.infinity,
        height: 75,
        color: color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.bar_chart,
                  size: 16,
                ),
                Text("Reports",
                    style: TextStyle(color: Colors.white70, fontSize: 12))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      width: 25,
                      height: 25,
                      child: Icon(Icons.ballot_rounded),
                    )),
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                val,
                                style: TextStyle(color: white, fontSize: 18),
                              ),
                              Text("(Last checked 2 hours ago)",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 10)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 5,
                        child: Divider(
                          color: white,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total:32434Kwh",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10)),
                          Text("Min:32434Kwh",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10)),
                          Text("Max:32434Kwh",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 10)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
