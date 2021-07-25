import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/home_screen.dart';
import 'package:epcc/Screens/subUnits.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UnitsPage extends GetView<UnitsController> {
  // List<UNITDATAMODEL> unitOneDetails = [];
  // List<UNITDATAMODEL> unitTwoDetails = [];
  // List<UNITDATAMODEL> unitThreeDetails = [];
  // List<UNITDATAMODEL> unitFourDetails = [];
  // List<ConsumptionModel> unitOne = [];
  // List<ConsumptionModel> unitTwo = [];
  // List<ConsumptionModel> unitThree = [];
  // List<ConsumptionModel> unitFour = [];
  // List<String> centerNames = [];

  // List<dynamic> buttonText = [];
  // List<Color> buttonColor = [];
  // String title = "";
  // String locationName = '';

  // int button = 0;

  // UnitsPage(
  //     {required this.unitOneDetails,
  //     required this.unitTwoDetails,
  //     required this.unitThreeDetails,
  //     required this.unitFourDetails,
  //     required this.unitOne,
  //     required this.unitTwo,
  //     required this.unitThree,
  //     required this.unitFour,
  //     required this.centerNames,
  //     required this.buttonColor,
  //     required this.buttonText,
  //     required this.button,
  //     required this.title,
  //     required this.locationName});

  final _subController = Get.find<SubUnitsController>();

  @override
  Widget build(BuildContext context) {
    // controller.addChartsDetails(unitOneDetails, unitTwoDetails,
    //     unitThreeDetails, unitFourDetails, button);
    controller.addChartsDetails(
        controller.unitOneDetails,
        controller.unitTwoDetails,
        controller.unitThreeDetails,
        controller.unitFourDetails,
        controller.buttonIndex);
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      size: 25,
                    )),
              )
            ]),
        body: Obx(() {
          return Column(children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: epccBlue500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          BottomNavigation.backToHomePage(
                              HomeScreen(), 1, true);
                          controller.chartOne.clear();
                          controller.chartTwo.clear();
                          controller.setUnitDropValue1(".");
                          controller.setUnitDropValue2(".");
                          controller.setUnitDropValue3(".");
                          _subController.unitOneValue.clear();
                          _subController.unitTwoValue.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 30,
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                            size: 22,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: double.infinity,
                        height: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 20,
                              child: Text(
                                controller.title,
                                style: TextStyle(color: epccBlue, fontSize: 14),
                              ),
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
                        controller.locationName,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.3,
                        endIndent: MediaQuery.of(context).size.width * 0.3,
                        color: white,
                      ),
                      SizedBox(
                        height: 0,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.UnitDropValue1.value,
                                    disabledHint: Text(""),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.red,
                                    focusColor: Colors.red,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setUnitDropValue1(val);
                                      controller.addChartsDetails(
                                          controller.unitOneDetails,
                                          controller.unitTwoDetails,
                                          controller.unitThreeDetails,
                                          controller.unitFourDetails,
                                          controller.buttonIndex);
                                    },
                                    items: controller.UnitDrop1.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButton<String>(
                                    value: controller.UnitDropValue2.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.red,
                                    focusColor: Colors.red,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setUnitDropValue2(val);
                                      controller.addChartsDetails(
                                          controller.unitOneDetails,
                                          controller.unitTwoDetails,
                                          controller.unitThreeDetails,
                                          controller.unitFourDetails,
                                          controller.buttonIndex);
                                    },
                                    items: controller.UnitDrop2.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.UnitDropValue3.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.green,
                                    focusColor: Colors.green,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setUnitDropValue3(val);
                                      controller.addChartsDetails(
                                          controller.unitOneDetails,
                                          controller.unitTwoDetails,
                                          controller.unitThreeDetails,
                                          controller.unitFourDetails,
                                          controller.buttonIndex);

                                      // BottomNavigation.changeProfileWidget(
                                      //     UnitsPage(
                                      //         unitOneDetails: unitOneDetails,
                                      //         unitTwoDetails: unitTwoDetails));
                                    },
                                    items: controller.UnitDrop3.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
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
                              child: controller.buttonIndex < 4
                                  ? Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      child: SfCartesianChart(
                                          primaryYAxis: CategoryAxis(
                                            title: AxisTitle(
                                                text: 'Consumptions (KHW)',
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                          primaryXAxis: CategoryAxis(
                                            title: AxisTitle(
                                                text: 'Day',
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                          series: <ColumnSeries>[
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        epccBlue500,
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 6,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource: controller.chartOne,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        Colors.green,
                                                // Hiding the legend item for this series
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 7,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource: controller.chartTwo,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                          ]))
                                  : Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      child: SfCartesianChart(
                                          primaryYAxis: CategoryAxis(
                                            title: AxisTitle(
                                                text: 'Consumption (KHW)',
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                          primaryXAxis: CategoryAxis(
                                            title: AxisTitle(
                                                text: 'Day',
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.w300)),
                                          ),
                                          series: <ColumnSeries>[
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        epccBlue500,
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 7,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource: controller.chartOne,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        Colors.green,
                                                // Hiding the legend item for this series
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 7,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource: controller.chartTwo,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        Colors.yellow,
                                                // Hiding the legend item for this series
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 7,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource:
                                                    controller.chartThree,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                            ColumnSeries<ChartData1, String>(
                                                pointColorMapper:
                                                    (ChartData1 color, _) =>
                                                        Colors.red,
                                                // Hiding the legend item for this series
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                        textStyle: TextStyle(
                                                            fontSize: 7,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        labelAlignment:
                                                            ChartDataLabelAlignment
                                                                .outer,
                                                        isVisible: true),
                                                dataSource:
                                                    controller.chartFour,
                                                xValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (ChartData1 data, _) =>
                                                        data.y),
                                          ])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 9,
                child: ListView(
                  children: [
                    getTiles(controller.colors[0], controller.buttonText[0],
                        "assets/images/748.png", () {
                      _subController.setUnitDetials(controller.unitOne);

                      _subController.setButtonIndex(2);
                      _subController
                          .setUnitButtonColor([Colors.red, Colors.green]);
                      _subController.SetButtonText(
                          [controller.centerName[0], controller.centerName[1]]);
                      _subController.SetTitle("TP1>Unit>1");
                      _subController.SetLocationName("Consumption Center");

                      BottomNavigation.changeProfileWidget(SubUnits());

                      // BottomNavigation.changeProfileWidget(SubUnits(
                      //   unitDetails: unitOne,
                      //   unitOneDetails: unitOneDetails,
                      //   unitTwoDetails: unitTwoDetails,
                      //   unitThreeDetails: unitThreeDetails,
                      //   unitFourDetails: unitFourDetails,
                      //   Unitbutton: button,
                      //   UnitbuttonColor: buttonColor,
                      //   UnitbuttonText: buttonText,
                      //   UnitcenterNames: centerNames,
                      //   UnitlocationName: locationName,
                      //   Unittitle: title,
                      //   unitOneDetail: unitOne,
                      //   unitTwoDetail: unitTwo,
                      //   unitThreeDetail: unitThree,
                      //   unitFourDetail: unitFour,
                      //   buttonColor: [Colors.red, Colors.green],
                      //   buttonText: [centerNames[0], centerNames[1]],
                      //   title: "TP1>Unit>1",
                      //   button: 2,
                      //   locationName: "Consumption Center",
                      // ));
                      // Get.toNamed(AppPages.SUBUNITS);
                    }),
                    getTiles(controller.colors[1], controller.buttonText[1],
                        "assets/images/748.png", () {
                      _subController.setUnitDetials(controller.unitTwo);
                      _subController.setButtonIndex(2);
                      _subController
                          .setUnitButtonColor([Colors.red, Colors.green]);
                      _subController.SetButtonText(
                          [controller.centerName[2], controller.centerName[3]]);
                      _subController.SetTitle("TP1>Unit>2");
                      _subController.SetLocationName("Consumption Center");

                      BottomNavigation.changeProfileWidget(SubUnits());
                      // BottomNavigation.changeProfileWidget(SubUnits(
                      //   unitDetails: unitTwo,
                      //   unitOneDetails: unitOneDetails,
                      //   unitTwoDetails: unitTwoDetails,
                      //   unitThreeDetails: unitThreeDetails,
                      //   unitFourDetails: unitFourDetails,
                      //   Unitbutton: button,
                      //   UnitbuttonColor: buttonColor,
                      //   UnitbuttonText: buttonText,
                      //   UnitcenterNames: centerNames,
                      //   UnitlocationName: locationName,
                      //   Unittitle: title,
                      //   unitOneDetail: unitTwo,
                      //   unitTwoDetail: unitTwo,
                      //   unitThreeDetail: unitThree,
                      //   unitFourDetail: unitFour,
                      //   buttonColor: [Colors.red, Colors.green],
                      //   buttonText: [centerNames[2], centerNames[3]],
                      //   title: "TP2",
                      //   button: 2,
                      //   locationName: "Consumption Center",
                      // ));
                      // Get.toNamed(AppPages.SUBUNITS);
                    }),
                    controller.buttonIndex == 4
                        ? Column(
                            children: [
                              getTiles(
                                  controller.colors[2],
                                  controller.buttonText[2],
                                  "assets/images/748.png", () {
                                _subController
                                    .setUnitDetials(controller.unitThree);
                                _subController.setButtonIndex(2);
                                _subController.setUnitButtonColor(
                                    [Colors.red, Colors.green]);
                                _subController.SetButtonText([
                                  controller.centerName[4],
                                  controller.centerName[5]
                                ]);
                                _subController.SetTitle("TP1>Unit>3");
                                _subController.SetLocationName(
                                    "Consumption Center");

                                BottomNavigation.changeProfileWidget(
                                    SubUnits());
                              }),
                              getTiles(
                                  controller.colors[3],
                                  controller.buttonText[3],
                                  "assets/images/748.png", () {
                                _subController
                                    .setUnitDetials(controller.unitFour);
                                print(controller.centerName.length);
                                controller.centerName.length == 7
                                    ? _subController.setButtonIndex(1)
                                    : _subController.setButtonIndex(2);
                                _subController.setUnitButtonColor(
                                    [Colors.red, Colors.green]);
                                controller.centerName.length == 7
                                    ? _subController.SetButtonText(
                                        [controller.centerName[6]])
                                    : _subController.SetButtonText([
                                        controller.centerName[6],
                                        controller.centerName[7]
                                      ]);
                                _subController.SetTitle("TP1>Unit>4");
                                _subController.SetLocationName(
                                    "Consumption Center");

                                BottomNavigation.changeProfileWidget(
                                    SubUnits());

                                // BottomNavigation.changeProfileWidget(SubUnits(
                                //   unitDetails: unitFour,
                                //   unitOneDetails: unitOneDetails,
                                //   unitTwoDetails: unitTwoDetails,
                                //   unitThreeDetails: unitThreeDetails,
                                //   unitFourDetails: unitFourDetails,
                                //   Unitbutton: button,
                                //   UnitbuttonColor: buttonColor,
                                //   UnitbuttonText: buttonText,
                                //   UnitcenterNames: centerNames,
                                //   UnitlocationName: locationName,
                                //   Unittitle: title,
                                //   unitOneDetail: unitOne,
                                //   unitTwoDetail: unitTwo,
                                //   unitThreeDetail: unitThree,
                                //   unitFourDetail: unitFour,
                                //   buttonColor: [Colors.red, Colors.green],
                                //   buttonText: centerNames.length == 8
                                //       ? [centerNames[6], centerNames[7]]
                                //       : [centerNames[6]],
                                //   title: "TP4",
                                //   button: centerNames.length == 8 ? 2 : 1,
                                //   locationName: "Consumption Center",
                                // ));
                                // Get.toNamed(AppPages.SUBUNITS);
                              })
                            ],
                          )
                        : Container(),
                  ],
                )),
          ]);
        }));
  }

  getTiles(Color color, String val, imageText, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
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
                    color: white,
                    size: 16,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text("Reports",
                      style: TextStyle(color: Colors.white70, fontSize: 10))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage(imageText),
                        color: white,
                        width: 50,
                        height: 50,
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
                                    color: Colors.white70, fontSize: 9)),
                            Text("Min:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 9)),
                            Text("Max:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 9)),
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
      ),
    );
  }
}
