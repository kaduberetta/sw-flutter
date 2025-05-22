import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/routes/auth_guard.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/core/widgets/not_found_page.dart';
import 'package:sw_flutter_carlos/features/auth/view/login_page.dart';
import 'package:sw_flutter_carlos/features/auth/viewmodel/login_provider.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/view/create_order_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/list_orders_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/order_details_page.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.login,
  refreshListenable: sl<LoginProvider>().isAuthenticated,
  routes: [
    GoRoute(path: RouteConstants.login, builder: (context, state) => const LoginPage()),
    GoRoute(
      redirect: authGuard,
      path: RouteConstants.listOrders,
      builder: (context, state) => const ListOrdersPage(),
    ),
    GoRoute(
      redirect: authGuard,
      path: RouteConstants.orderDetails,
      builder: (context, state) {
        final order = state.extra as OrderModel;
        return OrderDetailsPage(order: order);
      },
    ),
    GoRoute(
      redirect: authGuard,
      path: RouteConstants.createOrder,
      builder: (context, state) => CreateOrderPage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
