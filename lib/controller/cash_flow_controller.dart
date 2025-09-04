import 'package:b_wallet/models/chart_data_model.dart';
import 'package:get/get.dart';

class CashFlowController extends GetxController {
  final List<ChartDataModel> chartData = [
    ChartDataModel("Mon", 70, 60),
    ChartDataModel("Tue", 80, 65),
    ChartDataModel("Wed", 75, 55),
    ChartDataModel("Thu", 85, 70),
    ChartDataModel("Fri", 50, 45),
    ChartDataModel("Sat", 30, 40),
    ChartDataModel("Sun", 40, 50),
  ];
}
