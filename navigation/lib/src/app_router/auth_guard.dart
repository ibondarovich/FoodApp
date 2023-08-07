import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AuthGuard extends AutoRedirectGuard {
  final AuthService authService;
  AuthGuard({
    required this.authService,
  }) {
    authService.addListener(() {
      if (!authService.authenticated) {
        reevaluate();
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.authenticated) {
      resolver.next(true);
    } else {
      router.pushAndPopUntil(
        const AuthRoute(),
        predicate: (Route<dynamic> route) {
          return false;
        },
      );
    }
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    return Future(() => false);
  }
}
