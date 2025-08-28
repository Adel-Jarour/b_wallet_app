import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/models/notify_model.dart';
import 'package:get/get.dart';

class NotifyController extends GetxController {
  bool noNotify = false;

  List<NotifyModel> notificationList = [
    NotifyModel(
      title: 'Promo 40% Discount for special day in the long weekend',
      desc: '6 hour ago',
      icon: ImageConst.percentIcon,
      color: ColorConst.softRedColor,
    ),
    NotifyModel(
      title:
          'The sistem will have a maintainance for a several hour in this day',
      desc: '6 hour ago',
      icon: ImageConst.speakerIcon,
      color: ColorConst.purpleColor,
    ),
    NotifyModel(
      title:
          'The sistem will have a maintainance for a several hour in this day',
      desc: '6 hour ago',
      icon: ImageConst.requestIcon,
      color: ColorConst.orangeColor,
    ),
    NotifyModel(
      title: 'Promo 40% Discount for special day in the long weekend',
      desc: '6 hour ago',
      icon: ImageConst.percentIcon,
      color: ColorConst.softRedColor,
    ),
    NotifyModel(
      title: 'Promo 40% Discount for special day in the long weekend',
      desc: '6 hour ago',
      icon: ImageConst.percentIcon,
      color: ColorConst.softRedColor,
    ),
    NotifyModel(
      title:
          'The sistem will have a maintainance for a several hour in this day',
      desc: '6 hour ago',
      icon: ImageConst.speakerIcon,
      color: ColorConst.purpleColor,
    ),
    NotifyModel(
      title:
          'The sistem will have a maintainance for a several hour in this day',
      desc: '6 hour ago',
      icon: ImageConst.requestIcon,
      color: ColorConst.orangeColor,
    ),
  ];
}
