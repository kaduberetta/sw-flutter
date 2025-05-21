import 'package:get_it/get_it.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerSingleton<LoginProvider>(LoginProvider());
  sl.registerSingleton<ListOrdersProvider>(ListOrdersProvider());
  await sl.allReady();
}
