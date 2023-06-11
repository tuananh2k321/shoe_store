import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shoe_store/routes/app_route_constants.dart';
import 'package:shoe_store/screen/BottomTabs.dart';
import 'package:shoe_store/screen/SignIn.dart';
import 'package:shoe_store/screen/SignUp.dart';
import 'package:shoe_store/screen/Splash.dart';
import 'package:shoe_store/screen/bottom_tabs/Review.dart';
import 'package:shoe_store/screen/bottom_tabs/DetailProduct.dart';
import 'package:shoe_store/screen/error_page.dart';

class MyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.splashRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: Splash());
          },
        ),

        

        GoRoute(
          name: MyAppRouteConstants.signUpRouteName,
          path: '/SignUp',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignUp());
          },
        ),

        // GoRoute(
        //   name: MyAppRouteConstants.signInRouteName,
        //   path: '/SignIn/:name/:email',
        //   pageBuilder: (context, state) {
        //     return  MaterialPage(
        //         child: SignIn(
        //           email: state.queryParameters['email']!,
        //           name: state.queryParameters['name']!,
        //     ));
        //   },
        // ),

        GoRoute(
          name: MyAppRouteConstants.signInRouteName,
          path: '/SignIn',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignIn());
          },
        ),

        GoRoute(
          name: MyAppRouteConstants.bottomRouteName,
          path: '/BottomTabs',
          pageBuilder: (context, state) {
            return const MaterialPage(child: BottomTabs());
          },
        ),

        
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
      // redirect: (context, state) {
      //   if (!isAuth &&
      //       state.location
      //           .startsWith('/${MyAppRouteConstants.signInRouteName}')) {
      //     return context.namedLocation(MyAppRouteConstants.signInRouteName);
      //   } else {
      //     return null;
      //   }
      // },
    );
    return router;
  }
}
