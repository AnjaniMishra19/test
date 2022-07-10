import 'package:flutter/material.dart';
import 'package:sahash/customWidgets/custom_attendence.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<BarChartModel, String>> _seriesBarChartData;
  List<charts.Series<Sales, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<Task, String>>[];
    _seriesBarChartData = <charts.Series<BarChartModel, String>>[];
    _seriesLineData = <charts.Series<Sales, int>>[];
    _generateData();
  }

  _generateData() {
    // for BarChart(initialize data)
    var data1 = [
      BarChartModel('USA', 1980, 30),
      BarChartModel('Asia', 1981, 40),
      BarChartModel('Europe', 1982, 10),
    ];
    var data2 = [
      BarChartModel('USA', 1980, 100),
      BarChartModel('Asia', 1981, 150),
      BarChartModel('Europe', 1982, 80),
    ];
    var data3 = [
      BarChartModel('USA', 1980, 200),
      BarChartModel('Asia', 1981, 300),
      BarChartModel('Europe', 1982, 180),
    ];

    // for Line Chart(initialize data)
    var linearSalesData1 = [
      Sales(0, 45),
      Sales(1, 55),
      Sales(2, 65),
      Sales(3, 75),
      Sales(4, 85),
      Sales(5, 95),
    ];
    var linearSalesData2 = [
      Sales(0, 35),
      Sales(1, 95),
      Sales(2, 25),
      Sales(3, 15),
      Sales(4, 15),
      Sales(5, 85),
    ];
    var linearSalesData3 = [
      Sales(0, 15),
      Sales(1, 85),
      Sales(2, 35),
      Sales(3, 75),
      Sales(4, 25),
      Sales(5, 15),
    ];

    // for PieChart(initialize data)
    var pieData = [
      Task('Work', 35.8, const Color(0xff3366cc)),
      Task('Eat', 8.3, const Color(0xff990099)),
      Task('Commute', 10.8, const Color(0xff109618)),
      Task('Tv', 15.6, const Color(0xfffdbe19)),
      Task('Sleep', 19.2, const Color(0xffff9900)),
      Task('Other', 10.3, const Color(0xffdc3912)),
    ];

    // for PieChart
    _seriesPieData.add(charts.Series(
      id: 'Daily Task',
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskvalue,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorval),
      labelAccessorFn: (Task row, _) => '${row.taskvalue} \n ${row.task}',
    ));

    // for BarChart
    _seriesBarChartData.add(charts.Series(
      id: '2020',
      data: data1,
      domainFn: (BarChartModel barChartModel, _) => barChartModel.place,
      measureFn: (BarChartModel barChartModel, _) => barChartModel.quantity,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      fillColorFn: (BarChartModel barChartModel, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xff990099)),
    ));
    _seriesBarChartData.add(charts.Series(
      id: '2021',
      data: data2,
      domainFn: (BarChartModel barChartModel, _) => barChartModel.place,
      measureFn: (BarChartModel barChartModel, _) => barChartModel.quantity,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      fillColorFn: (BarChartModel barChartModel, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xff109618)),
    ));
    _seriesBarChartData.add(charts.Series(
      id: '2022',
      data: data3,
      domainFn: (BarChartModel barChartModel, _) => barChartModel.place,
      measureFn: (BarChartModel barChartModel, _) => barChartModel.quantity,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      fillColorFn: (BarChartModel barChartModel, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xffff9900)),
    ));

    //for LineChart
    _seriesLineData.add(charts.Series(
      id: 'Air Pollution',
      data: linearSalesData1,
      domainFn: (Sales sales, _) => sales.yearval,
      measureFn: (Sales sales, _) => sales.salesval,
      colorFn: (__, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xffff9900)),
    ));
    _seriesLineData.add(charts.Series(
      id: 'Air Pollution',
      data: linearSalesData2,
      domainFn: (Sales sales, _) => sales.yearval,
      measureFn: (Sales sales, _) => sales.salesval,
      colorFn: (__, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xff109618)),
    ));
    _seriesLineData.add(charts.Series(
      id: 'Air Pollution',
      data: linearSalesData3,
      domainFn: (Sales sales, _) => sales.yearval,
      measureFn: (Sales sales, _) => sales.salesval,
      colorFn: (__, _) =>
          charts.ColorUtil.fromDartColor(const Color(0xff990099)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Attendence"),
                      Text("Date"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomAttendence(
                        bordercolor: const Color(0xFF567DF4),
                        boxcolor: const Color(0xFF567DF4).withOpacity(0.1),
                        attendenceno: "12",
                        attendencedata: "Present",
                      ),
                      const SizedBox(width: 10),
                      CustomAttendence(
                        bordercolor: const Color(0xFFFF8919),
                        boxcolor: const Color(0xFFFF8919).withOpacity(0.1),
                        attendenceno: "1",
                        attendencedata: "Absent",
                      ),
                      const SizedBox(width: 10),
                      CustomAttendence(
                        bordercolor: const Color(0xFF4CE364),
                        boxcolor: const Color(0xFF4CE364).withOpacity(0.1),
                        attendenceno: "2",
                        attendencedata: "Holiday",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomAttendence(
                        bordercolor: const Color(0xFFE8B500),
                        boxcolor: const Color(0xFFE8B500).withOpacity(0.1),
                        attendenceno: "6",
                        attendencedata: "HalfDay",
                      ),
                      const SizedBox(width: 10),
                      CustomAttendence(
                        bordercolor: const Color(0xFF806DF0),
                        boxcolor: const Color(0xFF806DF0).withOpacity(0.1),
                        attendenceno: "1",
                        attendencedata: "WeekOff",
                      ),
                      const SizedBox(width: 10),
                      CustomAttendence(
                        bordercolor: const Color(0xFF4ACDF9),
                        boxcolor: const Color(0xFF4ACDF9).withOpacity(0.1),
                        attendenceno: "3",
                        attendencedata: "Leave",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Text('Time spent on daily task'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: charts.PieChart(
                      _seriesPieData,
                      animate: true,
                      animationDuration: const Duration(seconds: 2),
                      behaviors: [
                        charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 2,
                          cellPadding:
                              const EdgeInsets.only(right: 4.0, bottom: 4.0),
                          entryTextStyle: charts.TextStyleSpec(
                              color: charts.MaterialPalette.purple.shadeDefault,
                              fontSize: 11),
                        ),
                      ],
                      defaultRenderer: charts.ArcRendererConfig(
                          arcWidth: 100,
                          arcRendererDecorators: [
                            charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Text('Sales for the first 5 years'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: charts.LineChart(
                      _seriesLineData,
                      animate: true,
                      animationDuration: const Duration(seconds: 2),
                      defaultRenderer: charts.LineRendererConfig(
                        includeArea: true,
                        stacked: true,
                      ),
                      behaviors: [
                        charts.ChartTitle('Years',
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('Sales',
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('Depatments',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Text('Time spent on daily task'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: charts.BarChart(
                      _seriesBarChartData,
                      animate: true,
                      animationDuration: const Duration(seconds: 2),
                      barGroupingType: charts.BarGroupingType.grouped,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class BarChartModel {
  String place;
  int year;
  int quantity;

  BarChartModel(this.place, this.year, this.quantity);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
