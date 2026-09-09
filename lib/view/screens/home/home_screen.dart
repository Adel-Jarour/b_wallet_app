import 'package:b_wallet/view/screens/home/widget/custom_home_articles.dart';
import 'package:b_wallet/view/screens/home/widget/custom_home_category.dart';
import 'package:b_wallet/view/screens/home/widget/custom_home_header.dart';
import 'package:b_wallet/view/screens/home/widget/custom_home_promo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          const CustomHomeArticles(),
        ],
      ),
    );
  }
}
