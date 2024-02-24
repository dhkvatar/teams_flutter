import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A RoutingFlow defines a hierarchical navigation flow.
abstract class RoutingFlow {
  /// The name of the route path starting point.
  String get startingRoutePath;

  /// The children routes of the routing flow.
  RouteBase routes(GlobalKey<NavigatorState> rootNavigatorKey);
}
