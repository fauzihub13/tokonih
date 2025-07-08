import 'package:flutter_tokonih/core/router/route_name.dart';
import 'package:flutter_tokonih/features/auth/views/login_page.dart';
import 'package:flutter_tokonih/features/auth/views/register_page.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';
import 'package:flutter_tokonih/features/home/views/notification_page.dart';
import 'package:flutter_tokonih/features/home/views/profile_page.dart';
import 'package:flutter_tokonih/features/product/views/add_new_product_page.dart';
import 'package:flutter_tokonih/features/product/views/manage_product_page.dart';
import 'package:flutter_tokonih/features/product/views/product_detail_page.dart';
import 'package:flutter_tokonih/features/product/views/product_list_page.dart';
import 'package:flutter_tokonih/features/product/views/product_review_page.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:flutter_tokonih/models/response/detail_product_response_model.dart'
    as detail_product_model_response;
import 'package:go_router/go_router.dart';

class RoutePage {
  static bool isLoggedIn = false;

  static final goRouter = GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final loggingIn =
          state.matchedLocation == '/${RouteName.loginPage}' ||
          state.matchedLocation == '/${RouteName.registerPage}';

      if (!isLoggedIn && !loggingIn) {
        return '/${RouteName.loginPage}';
      }

      if (isLoggedIn && loggingIn) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        name: RouteName.landingPage,
        path: '/',
        builder: (context, state) {
          final index = state.extra is int ? state.extra as int : 0;
          return LandingPage(index: index);
        },
      ),
      GoRoute(
        name: RouteName.loginPage,
        path: '/${RouteName.loginPage}',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: RouteName.registerPage,
        path: '/${RouteName.registerPage}',
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        name: RouteName.notificationPage,
        path: '/${RouteName.notificationPage}',
        builder: (context, state) => NotificationPage(),
      ),
      GoRoute(
        name: RouteName.profilePage,
        path: '/${RouteName.profilePage}',
        builder: (context, state) => ProfilePage(),
      ),
      GoRoute(
        name: RouteName.manageProductPage,
        path: '/${RouteName.manageProductPage}',
        builder: (context, state) => ManageProductPage(),
      ),
      GoRoute(
        name: RouteName.addNewProductPage,
        path: '/${RouteName.addNewProductPage}',
        builder: (context, state) {
          final product =
              state.extra is Product ? state.extra as Product : null;
          return AddNewProductPage(product: product);
        },
      ),
      GoRoute(
        name: RouteName.productDetailPage,
        path: '/${RouteName.productDetailPage}',
        builder: (context, state) {
          int productId = state.extra as int;
          return ProductDetailPage(productId: productId);
        },
      ),
      GoRoute(
        name: RouteName.productListPage,
        path: '/${RouteName.productListPage}',
        builder: (context, state) => ProductListPage(),
      ),
      GoRoute(
        name: RouteName.productReviewPage,
        path: '/${RouteName.productReviewPage}',
        builder: (context, state) {
          List<detail_product_model_response.Review> reviews =
              state.extra as List<detail_product_model_response.Review>;
          return ProductReviewPage(reviews: reviews);
        },
      ),
    ],
  );
}
