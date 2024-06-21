import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scorn_clone/screens/home.dart';
import 'package:scorn_clone/screens/plan_detail_addition_page.dart';
import 'package:scorn_clone/screens/plan_history_page.dart';
import 'package:scorn_clone/screens/plan_naming_addition_page.dart';

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
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage(child: PlanHistoryPage()),
          ),
          GoRoute(
            path: 'planDetailAddition',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage(child: PlanDetailAdditionPage()),
          ),
          GoRoute(
            path: 'planNamingAddition',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                MaterialPage(child: PlanNamingAdditionPage()),
          ),
        ],
      ),
    ],
  );
  runApp(MaterialApp.router(
    routerConfig: _router,
  ));
}
