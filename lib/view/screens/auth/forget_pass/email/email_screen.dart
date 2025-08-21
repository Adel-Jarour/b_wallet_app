import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/view/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primaryColor,
        leading: const CustomArrowBack(),
      ),
      // body: ,
    );
  }
}
