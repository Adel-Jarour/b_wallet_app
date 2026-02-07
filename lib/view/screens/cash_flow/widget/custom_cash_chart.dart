import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/models/chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomCashChart extends StatefulWidget {
  const CustomCashChart({super.key});

  @override
  State<CustomCashChart> createState() => _CustomCashChartState();
}

class _CustomCashChartState extends State<CustomCashChart>
    with SingleTickerProviderStateMixin {
  late final CashFlowController controller;
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CashFlowController>();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _showChart = true);
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_showChart) {
      return SizedBox(
        height: 220,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: ColorConst.primaryColor,
          ),
        ),
      );
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        enableSideBySideSeriesPlacement: false,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
        ),
        primaryYAxis: const NumericAxis(isVisible: false),
        series: [
          StackedColumnSeries<ChartDataModel, String>(
            dataSource: controller.chartData,
            xValueMapper: (d, _) => d.day,
            yValueMapper: (d, _) => d.income,
            name: Strings.cashFlowIncome,
            color: ColorConst.primaryColor,
            width: 0.25,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            isTrackVisible: true,
            trackColor: ColorConst.grey4Color,
            trackBorderColor: Colors.transparent,
          ),
          StackedColumnSeries<ChartDataModel, String>(
            dataSource: controller.chartData,
            xValueMapper: (d, _) => d.day,
            yValueMapper: (d, _) => d.expense,
            name: Strings.cashFlowExpense,
            color: ColorConst.orangeColor,
            width: 0.25,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ],
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
      ),
    );
  }
}
