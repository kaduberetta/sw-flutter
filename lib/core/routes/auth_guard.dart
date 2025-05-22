import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:sw_flutter_carlos/core/routes/route_constants.dart';

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final isLoggedIn = await storage.read(key: 'access_token') != null;
  if (isLoggedIn) {
    return null; // User is logged in, allow access to the route
  } else {
    return RouteConstants.login; // User is not logged in, redirect to the login page
  }
}
