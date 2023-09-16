import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lol_app/app/dependencies/injection.dart';
import 'package:lol_app/app/utils/colors_app.dart';

import 'app/config/router.dart';

void main() {
  GetIt getIt = GetIt.instance;
  Injector.init(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: ColorsApp.primaryColor,
            appBarTheme: AppBarTheme(
              backgroundColor: ColorsApp.primaryColor,
            ),
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'LOL Champions D',
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
