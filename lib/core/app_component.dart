import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todos_clean_arch_riverpod/features/calender/calender_page.dart';
import 'package:todos_clean_arch_riverpod/features/chat/chat_page.dart';
import 'package:todos_clean_arch_riverpod/features/feed/feed_page.dart';

import '../features/home/home_screen.dart';
import '../features/setting/SettingPage.dart';
import '../style/customTheme.dart';

class AppComponent extends StatelessWidget {
  AppComponent({Key? key}) : super(key: key);

  final _rootRouter = GoRouter(
    initialLocation: '/home/feed',
    navigatorBuilder: (context, state, child) => Material(
      child: Column(
        children: [
          Expanded(child: child),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(state.location),
          ),
        ],
      ),
    ),
    routes: [
      GoRoute(
        name: 'home',
        // redirect: (_) => '/home',
        path: '/home/:tab(feed|calender|chat|setting)',
        pageBuilder: (context, state) {
          final tab = state.params['tab']!;

          return MaterialPage(
            key: state.pageKey,
            child: HomePage(title: "Home", tab: tab),
          );
        },
        routes: [
          GoRoute(
              redirect: (state) => state.namedLocation('home', params: {'tab': 'feed'}),
              path: 'feed',
              pageBuilder: (context, state) => CustomTransitionPage(
                    child: const FeedPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
                    key: state.pageKey,
                  )
              // pageBuilder: (context, state) => CustomPage<void>(
              //   key: state.pageKey,
              //   child: const FeedPage(),
              // ),
              ),
          GoRoute(
            path: 'calender',
            redirect: (state) => state.namedLocation('home', params: {'tab': 'calender'}),
            // pageBuilder: (context, state) => CustomTransitionPage(
            //   child: const CalenderPage(),
            //   transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
            //   key: state.pageKey,
            // ),
          ),
          GoRoute(
            path: 'chat',
            redirect: (state) => state.namedLocation('home', params: {'tab': 'chat'}),
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: ChatPage(),
            ),
          ),
          GoRoute(
            path: 'setting',
            redirect: (state) => state.namedLocation('home', params: {'tab': 'setting'}),
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: SettingPage(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: defaultErrorPageBuilder(),
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routeInformationProvider: _rootRouter.routeInformationProvider,
        routeInformationParser: _rootRouter.routeInformationParser,
        routerDelegate: _rootRouter.routerDelegate,
        title: 'Flutter Demo',
        theme: ThemeData.from(
          colorScheme: ColorScheme.light(
            secondary: CustomColor.primaryColor,
            primary: CustomColor.secondaryColor,
            background: CustomColor.backgroundColor,
          ),
        ).copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
            ),
            cardTheme: CardTheme(
              margin: const EdgeInsets.all(0),
              // shape: ContinuousRectangleBorder(
              //   borderRadius: BorderRadius.circular(64.0),
              // ),
              // RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(32.0),
              // ),
              color: CustomColor.primaryColor,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: CustomColor.backgroundColor,
              shadowColor: Colors.transparent,
            )),
        // home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

GoRouterPageBuilder defaultErrorPageBuilder() {
  return (BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text("Not found"),
        ),
      ),
    );
  };
}
