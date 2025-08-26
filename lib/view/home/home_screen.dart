import 'package:b_wallet/config/translation/strings_enum.dart';
import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/const/image_const.dart';
import 'package:b_wallet/controller/home_controller.dart';
import 'package:b_wallet/view/home/widget/custom_home_articles.dart';
import 'package:b_wallet/view/home/widget/custom_home_category.dart';
import 'package:b_wallet/view/home/widget/custom_home_header.dart';
import 'package:b_wallet/view/home/widget/custom_home_promo.dart';
import 'package:b_wallet/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHomeHeader(),
          SizedBox(
            height: 24.h,
          ),
          CustomHomeCategory(),
          SizedBox(height: 24.h),
          const CustomHomePromo(),
          SizedBox(
            height: 24.h,
          ),
          CustomHomeArticles(),
        ],
      ),
    );
  }
}
