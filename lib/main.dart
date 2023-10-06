// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:iklin/core/navigators/route_name.dart';
import 'package:iklin/core/navigators/router.dart';
import 'package:iklin/core/sl/sl_container.dart';
import 'package:iklin/features/auth/presentation/change_notifier/auth_notifier.dart';
import 'package:iklin/features/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(
    DevicePreview(
      enabled: true,
      // ignore: prefer_const_literals_to_create_immutables
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthNotifier>(
          create: (_) => getIt<AuthNotifier>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
