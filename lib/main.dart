import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw_flutter_carlos/core/routes/app_routes.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/create_order_provider.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/order_details_provider.dart';
import 'package:sw_flutter_carlos/service_locator.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const SwApp());
}

class SwApp extends StatelessWidget {
  const SwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>.value(value: sl<LoginProvider>()),
        ChangeNotifierProvider<ListOrdersProvider>.value(value: sl<ListOrdersProvider>()),
        ChangeNotifierProvider<CreateOrderProvider>.value(value: sl<CreateOrderProvider>()),
        ChangeNotifierProvider<OrderDetailsProvider>.value(value: sl<OrderDetailsProvider>()),
      ],
      child: MaterialApp.router(
        title: 'SW Flutter - Carlos Beretta',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
