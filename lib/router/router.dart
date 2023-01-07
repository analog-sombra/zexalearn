import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zexalearn/main.dart';

final appRouteState = Provider((ref) {
  final notifier = ref.read(appredirection);
  return GoRouter(
    initialLocation: "/",
    refreshListenable: notifier,
    routes: notifier.routes(),
    redirect: (context, state) {
      if (notifier.isLogin == false) {
        return "/login";
      }
      return null;
    },
  );
});

final appredirection = Provider((ref) => AppRedirection());

class AppRedirection extends ChangeNotifier {
  bool isLogin = false;

  List<RouteBase> routes() {
    return [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return const Pageone();
        },
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) {
          return const Pagetwo();
        },
      ),
    ];
  }

  void setIsLogin(bool value) {
    isLogin = value;
    notifyListeners();
  }
}
