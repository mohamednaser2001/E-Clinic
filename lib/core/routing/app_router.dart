import 'package:e_clinic/core/routing/routes.dart';
import 'package:e_clinic/src/home/ui/screens/home_screen.dart';
import 'package:e_clinic/src/login/logic/login_cubit.dart';
import 'package:e_clinic/src/validation/logic/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../src/edit_profile_screen.dart';
import '../../src/login/ui/screens/login_screen.dart';
import '../../src/validation/ui/screens/otp_screen.dart';
import '../../src/authentication/ui/screens/signup_screen.dart';
import '../../src/authentication/view_model/signup_cubit/signup_cubit.dart';
import '../dependency_injection/dependency_injection.dart';


class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) =>
            EditProfileScreen());

      case Routes.signupRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (_) => getIt<SignupCubit>(),
              child: SignupScreen(),
            ));

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (_) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ));
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => getIt<OTPCubit>()..initData(routeSettings.arguments as String),
              child: OTPScreen(),
            ));

      default:
        return undefinedRoute();
    }
  }


  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (context) =>
    const Scaffold(
      body: Scaffold(
          body: Center(child: Text('No page founded'))),
    ));
  }
}