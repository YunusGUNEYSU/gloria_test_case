import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/routes/route.dart';
import 'package:gloria_test_case/core/service/constant.dart';
import 'package:gloria_test_case/core/theme/theme.dart';
import 'package:gloria_test_case/feature/auth/provider/provider.dart';
import 'package:gloria_test_case/feature/auth/view/login.dart';

import 'package:gloria_test_case/feature/auth/view/login_or_register.dart';
import 'package:gloria_test_case/feature/home/provider/activity_provider.dart';
import 'package:gloria_test_case/feature/home/provider/dashboard_provider.dart';
import 'package:gloria_test_case/feature/home/provider/home_provider.dart';
import 'package:gloria_test_case/feature/home/service/activity_service.dart';
import 'package:gloria_test_case/feature/home/service/dashboard_service.dart';
import 'package:gloria_test_case/feature/home/service/place_service.dart';

import 'package:gloria_test_case/feature/home/view/home_view.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'env/env.dart';
import 'feature/home/view/activity_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.SUPABASE_BASE_URL,
    anonKey: Env.SUPABASE_KEY,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
          create: (_) => ActivityProvider(iActivityService: ActivityService()),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(iPlaceService: PlaceService()),
        ),
        ChangeNotifierProvider(create: (_)=>DashBoardProvider(iDasboardService: DashBoardService())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        RoutePath.home.path: (context) => const HomeView(),
        RoutePath.activity.path: (context) => const ActivityView(),
        RoutePath.login.path: (context) => const LoginView(),
      },
      home: StreamBuilder(
          stream: supabase.auth.onAuthStateChange,
          builder: (context, snapshot) {
            if (snapshot.data?.session != null) {
              return const HomeView();
            }
            return const LoginOrRegister();
          }),
    );
  }
}
