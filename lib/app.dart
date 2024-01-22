import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tstore/bindings/general_bindings.dart';
import 'package:tstore/utils/constants/colors.dart';
import 'package:tstore/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'T Store',
        themeMode: ThemeMode.system,
        darkTheme: TAppTheme.darkTheme,
        theme: TAppTheme.lightTheme,
        initialBinding: GeneralBindings(),
        // Show loader or circular progress indicatore meanwhile auth repo is deciding to show relevant screen

        home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}
