import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/core/routes/app_routes.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const SwApp());
}

class SwApp extends StatelessWidget {
  const SwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SW Flutter - Carlos Beretta',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
