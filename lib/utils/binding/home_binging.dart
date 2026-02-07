import 'package:b_wallet/controller/cash_flow_controller.dart';
import 'package:b_wallet/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CashFlowController>(() => CashFlowController());
  }
}
