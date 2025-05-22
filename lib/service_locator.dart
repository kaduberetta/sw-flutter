import 'package:get_it/get_it.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/order_details_provider.dart';
import 'package:sw_flutter_carlos/features/auth/service/auth_service.dart';
import 'package:sw_flutter_carlos/features/orders/service/orders_service.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerLazySingleton<AuthService>(() => AuthService());
  sl.registerLazySingleton<OrdersService>(() => OrdersService());
  sl.registerSingleton<LoginProvider>(LoginProvider(sl<AuthService>()));
  sl.registerSingleton<ListOrdersProvider>(ListOrdersProvider(sl<OrdersService>()));
  sl.registerFactory<OrderDetailsProvider>(() => OrderDetailsProvider(sl<OrdersService>()));
  await sl.allReady();
}
