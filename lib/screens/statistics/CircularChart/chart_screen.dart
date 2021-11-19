import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model_and_data.dart';

class CircularChart extends StatefulWidget {
  const CircularChart({Key? key}) : super(key: key);

  @override
  _CircularChartState createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(.4),
        title: const Text('Estadisticas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: height,
        width: width,
        child: SfCircularChart(
          title: ChartTitle(text: 'Estado en Picking'),
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            isResponsive: true,
            overflowMode: LegendItemOverflowMode.wrap,
            toggleSeriesVisibility: true,
          ),
          series: <PieSeries<CircularChartModel, String>>[
            PieSeries(
              dataSource: data,
              xValueMapper: (datum, index) => datum.countryName,
              yValueMapper: (datum, index) => datum.aircrafts,
              animationDelay: 120,
              animationDuration: 18,
              explodeAll: true,
              explode: true,
              onPointTap: (val) {
                int index = val.viewportPointIndex!.round();
                CircularChartModel _data = data[index];
                buildShowModalBottomSheet(context, height, width, _data);
              },
              explodeIndex: 3,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                labelIntersectAction: LabelIntersectAction.none,
                connectorLineSettings: ConnectorLineSettings(
                  type: ConnectorType.curve,
                  color: Color.fromRGBO(
                    Random().nextInt(125),
                    Random().nextInt(125),
                    Random().nextInt(125),
                    1,
                  ),
                  length: '5%',
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, double height,
      double width, CircularChartModel _data) {
    return showModalBottomSheet(
      backgroundColor: Colors.red.withOpacity(0 * 1),
      context: context,
      builder: (context) => SizedBox(
        height: height / 2,
        width: width,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              child: SizedBox(
                width: width,
                height: height / 3,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          _data.countryName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      buildCard('Campo1', _data.tanks),
                      buildCard('Campo2', "0"),
                      buildCard('Campo3', _data.aircrafts.toString()),
                      buildCard('Campo4', _data.submarines),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(String text, String data) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(text),
            Text(
              data,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                inherit: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
