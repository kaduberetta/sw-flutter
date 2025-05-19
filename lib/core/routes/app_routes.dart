import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/core/widgets/not_found_page.dart';
import 'package:sw_flutter_carlos/features/auth/view/home_page.dart';
import 'package:sw_flutter_carlos/features/auth/view/login_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/create_order_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/list_orders_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.login,
  routes: [
    GoRoute(path: RouteConstants.login, builder: (context, state) => const LoginPage()),
    GoRoute(path: RouteConstants.home, builder: (context, state) => const HomePage()),
    GoRoute(path: RouteConstants.listOrders, builder: (context, state) => const ListOrdersPage()),
    GoRoute(path: RouteConstants.createOrder, builder: (context, state) => const CreateOrderPage()),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
