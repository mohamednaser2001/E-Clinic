

import 'package:e_clinic/src/authentication/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: AppRoutes.onGeneratedRoute,
          title: 'E-Clinic',
          home: child,
        );
      },
      // child: RegisterScreen(),
    );
  }
}