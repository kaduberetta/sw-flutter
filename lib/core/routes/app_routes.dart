import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';
import 'package:sw_flutter_carlos/core/widgets/not_found_page.dart';
import 'package:sw_flutter_carlos/features/auth/view/login_page.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/view/create_order_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/list_orders_page.dart';
import 'package:sw_flutter_carlos/features/orders/view/order_details_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.login,
  routes: [
    GoRoute(path: RouteConstants.login, builder: (context, state) => const LoginPage()),
    GoRoute(path: RouteConstants.listOrders, builder: (context, state) => const ListOrdersPage()),
    GoRoute(
      path: RouteConstants.orderDetails,
      builder: (context, state) {
        final order = state.extra as OrderModel;
        return OrderDetailsPage(order: order);
      },
    ),
    GoRoute(path: RouteConstants.createOrder, builder: (context, state) => CreateOrderPage()),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
