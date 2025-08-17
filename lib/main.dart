import 'package:b_wallet/const/color_const.dart';
import 'package:b_wallet/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorConst.whiteColor,
            appBarTheme: AppBarTheme(
              backgroundColor: ColorConst.whiteColor,
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: ColorConst.primaryColor,
              selectionColor: ColorConst.primaryColor.withValues(alpha: 0.3),
              selectionHandleColor: ColorConst.primaryColor,
            ),
          ),
          initialRoute: AppPages.initial,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
