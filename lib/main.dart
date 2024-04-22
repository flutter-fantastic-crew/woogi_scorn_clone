import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scorn_clone/screens/home.dart';
import 'package:scorn_clone/screens/plan_history_page.dart';

void main() {
  /// The route configuration.
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'planHistory',
            builder: (BuildContext context, GoRouterState state) {
              return const PlanHistoryPage();
            },
          ),
        ],
      ),
    ],
  );
  runApp(MaterialApp.router(
    routerConfig: _router,
  ));
}
