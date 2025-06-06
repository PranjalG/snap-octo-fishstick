import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:layout/services/app_router.dart';
import 'package:layout/screens/initial/splash_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:path_provider/path_provider.dart';
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final String appTitle = 'Flutter Demo';

    return BlocProvider(
      create: (_) => AuthenticationBloc(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        child: MaterialApp(
          title: appTitle,
          onGenerateRoute: appRouter.onGenerateRoute,
          home: SplashScreen(),
          //home: HomeScreen(appTitle: appTitle),
        ),
      ),
    );
  }
}
