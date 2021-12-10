import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../../constants/covid_colors.dart';

class CovidChart extends StatefulWidget {
  const CovidChart({
    Key? key,
    required this.arrayLength,
    required this.xValueMapper,
    required this.yValueMapper
  }) : super(key: key);

  final int arrayLength;
  final dynamic Function(int) xValueMapper;
  final num Function(int) yValueMapper;

  @override
  State<CovidChart> createState() => _CovidChartState();
}

class _CovidChartState extends State<CovidChart> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this, 
      reverseDuration: const Duration(milliseconds: 7000),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();

    return FadeTransition(
      opacity: _animation,
      child: SfSparkLineChart.custom(
        dataCount: widget.arrayLength,
        xValueMapper: widget.xValueMapper,
        yValueMapper: widget.yValueMapper,
        color: CovidColors.darkRed,
        labelDisplayMode: SparkChartLabelDisplayMode.none,
        trackball: const SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap),
      ),
    );
  }
}