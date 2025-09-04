import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/models/chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomCashChart extends StatelessWidget {
  CustomCashChart({super.key});

  final CashFlowController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      enableSideBySideSeriesPlacement: false,
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      primaryYAxis: const NumericAxis(isVisible: false),
      series: [
        // Income (blue) — show the grey track here
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
          trackPadding: 0,
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
    );
  }
}
